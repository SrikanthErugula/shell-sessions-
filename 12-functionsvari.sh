#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then # so here $1 value anedhi ($?) status code value tisukunttadhi adhi below validate $? ichham akkada numchi vastunshi
        echo "ERROR:: Installing $2 is failure" # so here $2 value anedhi MYSQL ane value vunttadhi adhi below fun call chesam like "MYSQL" ani
        exit 1
    else
        echo "Installing $2 is SUCCESS" # so here $2 value anedhi MYSQL ane value vunttadhi adhi below fun call chesam like "MYSQL" ani
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"