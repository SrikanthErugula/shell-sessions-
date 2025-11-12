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
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo " install mysql is $R FAIl $N "
    exit 1
else
    echo " install mysql is $G Success $N "
fi
dnf install nginx -y
if [ $? -ne 0 ]; then
    echo " install nginx is $R FAIl $N "
    exit 1
else
    echo " install nginx is $G Success $N "
fi