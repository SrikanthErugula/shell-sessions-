#!/bin/bash

variuser=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $variuser -ne 0 ]; then 
    echo " ERROR:: please run with root user "
    exit 1
fi
SRI(){
if [ $1 -ne 0 ]; then
    echo -e " Installing $2 is $R FAIL $N"
else
    echo -e "Installing $2 is $G SUCCESS $N"
fi
}


dnf install mysql -y
SRI $? "MYSQL"