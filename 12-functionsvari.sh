#!/bin/bash
# session 16
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # here validate cmd is the functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then # so here $1 value anedhi ($?) status code value tisukunttadhi 
        echo "ERROR:: Installing $2 is failure" # so here $2 value anedhi MYSQL ane value vunttadhi 
        exit 1
    else
        echo "Installing $2 is SUCCESS" # so here $2 value anedhi MYSQL ane value vunttadhi 
    fi
}

# VALIDATE  is the function 
#$1 lo value is $? and  $2 values scrpit run avuthunte one by one tisukunttadhi like "MYSQL" after done next "Nginx" and "Python3" ala process vunttadhi

dnf install mysql -y
VALIDATE $? "MySQL"  # above lo vunaa function call chestunam and aa fun ki inputs $? ane cmd ni istuam 

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"

