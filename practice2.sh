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
Sri(){
    if [ $1 -ne 0 ]; then
    echo " install $2 is $R FAIl $N "
    exit 1
else
    echo " install $2 is $G Success $N "
fi
}
dnf install mysql -y
Sri $? "Mysql"
dnf install nginx -y
Sri $? "Nginx"