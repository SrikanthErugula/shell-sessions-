#!/bin/bash

#Number=$1
#if [ $Number -lt 10 ]; then
   # echo " the given number $Number is less then 10 "
#elif [ $Number -eq 10 ]; then
   # echo " the given number $Number is equal to 10 "
#else 
   # echo " the given number $Number is grater then 10 "
#fi

#ex 1 on even number 

echo " Please enter the number"
read S

if [ $(($S % 2)) -eq 0 ]; then
    echo " The given number $S is EVEN "
else 
    echo " The given number $S is ODD"
fi

echo " Could you please enter the number here"
read Sri
if [ $Sri -gt 35 ]; then
    echo " Srikanth got score $Sri so PASS "
#elif [ $Sri -eq 100 ]; then
    #echo " The Given Number $Sri is 0 number"

else 
    echo " Srikanth got score $Sri so FAIL"
fi

userid=$(id -u)
if [ $userid -ne 0 ]; then 
    echo " ERROR::Please run with root user"
    exit 1
fi

dnf remove mysql -y

if [ $? -ne 0 ]; then 
    echo " ERROR::mysql remove process fail"
    exit 1
else
    echo " Mysql remove porcess sucess"
fi
#=====================
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

#==================
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
    exit 1
else
    echo -e "Installing $2 is $G           SUCCESS $N" # so here entha space iste antha space output lo vastundhi
fi
}
dnf install mysql -y
SRI $? "MYSQL"

#===============================================