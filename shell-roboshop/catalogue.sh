#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
SCRIPT_DIR=$PWD
Mip=srimond.dsoaws.fun
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}
### NODE JS APPLICATION INSTALL PROCESS

dnf module disable nodejs -y &>>$LOG_FILE
VALIDATE $? "Disabled nodejs"
dnf module enable nodejs:20 -y &>>$LOG_FILE
VALIDATE $? "Enabled nodejs"

dnf install nodejs -y &>>$LOG_FILE
VALIDATE $? "Installed nodejs"

id roboshop
if [ $? -ne 0 ]; then

    useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop &>>$LOG_FILE
    VALIDATE $? "User Created"
else
     echo " User already created .....$Y SKIPPING $N"
fi


mkdir -p /app 

VALIDATE $? "Created app DIR"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>$LOG_FILE
VALIDATE $? "Downloaded the cata application"
cd /app 
VALIDATE $? "Changed the app DIR"

unzip /tmp/catalogue.zip &>>$LOG_FILE
VALIDATE $? "Unzipped Catalogue data or application "

npm install &>>$LOG_FILE
VALIDATE $? "installed the Dependencies"

cp $SCRIPT_DIR/catalogue.service /etc/systemd/system/catalogue.service &>>$LOG_FILE
VALIDATE $? "Copied systemctl services"

systemctl daemon-reload
VALIDATE $? "Daemon done" 
systemctl enable catalogue &>>$LOG_FILE
VALIDATE $? "Enable done"
systemctl start catalogue &>>$LOG_FILE
VALIDATE $? "Started"

cp $SCRIPT_DIR/srimongo /etc/yum.repos.d/mongo.repo 
VALIDATE $? "copied the mongorepo"
dnf install mongodb-mongosh -y &>>$LOG_FILE
VALIDATE $? "Installed client repo"

mongosh --host $MIP </app/db/master-data.js &>>$LOG_FILE
VALIDATE $? "Load cata products"
sytemctl restart catalogue
VALIDATE $? "Restarted FINAL"

# need to run the script

