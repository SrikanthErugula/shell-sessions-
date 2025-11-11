#!/bin/bash

sriuser=$(id -u)

if [ $sriuser -ne 0 ]; then
    echo " ERROR :: Please run this CMD with root user "
    exit 1
fi
Reddy(){
    if [ $1 -ne 0 ]; then
    echo " Install $2 is FAIL "
    exit 1
  else
     echo " install $2 is SUCCESS"
fi
}
dnf install mysql -y
Reddy $? " MySQLllll"
dnf install nginx -y
Reddy $? " Nginxxxx" 

