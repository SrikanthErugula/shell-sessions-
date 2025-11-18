#!/bin/bash

# Session 17

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-sessions-"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # 

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then # ikkada zero ki eqaul ithe validate step ki vastundhi
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

# $@
for package in $@
do
    # check package is already installed or not
    dnf list installed $package &>>$LOG_FILE

    # if exit status is 0, already installed. -ne 0 need to install it
    if [ $? -ne 0 ]; then # decision tisukovali ante manaki if condition kavali
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $Y SKIPPING $N"
    fi
done
