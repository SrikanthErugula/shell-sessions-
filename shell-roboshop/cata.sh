#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
SCRIPT_DIR=$PWD
MONGO_PVTIP=mangodb.dsoaws.fun
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

######## NODE JS #####
dnf module disable nodejs -y &>>$LOG_FILE
VALIDATE $? " DISABLING NODEJS"

dnf module enable nodejs:20 -y &>>$LOG_FILE
VALIDATE $? " ENABLING NODEJS"
dnf install nodejs -y &>>$LOG_FILE
VALIDATE $? " INSTALLING NODEJS"

id roboshop &>>$LOG_FILE
if [ $? -ne 0 ]; then
    useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
    VALIDATE $? " CREATING SYSTEM USER"
else
    echo -e " User already exist...... $Y SKIPPING $N"
fi

mkdir -p /app
VALIDATE $? " CREATING APP DIR" &>>$LOG_FILE

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>$LOG_FILE
VALIDATE $? " DOWNLOADING CATA CODE"

cd /app 
VALIDATE $? "CHAGING TO APP DIR"

rm -rf /app/*
VALIDATE $? "Removing exist code"

unzip /tmp/catalogue.zip &>>$LOG_FILE
VALIDATE $? " UNZIP CATA CODE"

npm install &>>$LOG_FILE
VALIDATE $? " INSTALL DEPENDECIES"

cp $SCRIPT_DIR/cataservice.repo /etc/systemd/system/catalogue.service &>>$LOG_FILE
VALIDATE $? " COPYING SYSTEM CATA CODE SERVICES"

systemctl daemon-reload
VALIDATE $? "DAEMON REALODED "

systemctl enable catalogue &>>$LOG_FILE
VALIDATE $? " ENEBLING CATA INSTACES"

systemctl start catalogue &>>$LOG_FILE

cp $SCRIPT_DIR/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? " COPY MONGO REPO CODE"

dnf install mongodb-mongosh -y &>>$LOG_FILE
VALIDATE $? " INSTALL MONGODB CLIENT"

mongosh --host $MONGO_PVTIP </app/db/master-data.js &>>$LOG_FILE
VALIDATE $? " LOAD CATA PRODUCTS"

systemctl restart cata &>>$LOG_FILE
VALIDATE $? " RESATARTING CATA"
