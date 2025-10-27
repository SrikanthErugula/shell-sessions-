#!/bin/bash

#USERID=$(id -u)

#if [ $USERID -ne 0 ]; then
   # echo "ERROR:: Please run this script with root privelege"
    #exit 1 # failure is other than 0 ( it means failure ane dhani dhaggara zero kakunda emaina ivvachu )
#fi

#dnf install mysql -y

#if [ $? -ne 0 ]; then
 #   echo "ERROR:: Installing MySQL is failure"
  #  exit 1
#else
 #   echo "Installing MySQL is SUCCESS"
    # exit 0 (success ane dhaggara zero ivachu but in shell emi ivvakapoina by defalut it will be consider as zero
#fi
# ]# sudo sh 12-installconditions.sh  (ila iste mysql install avuthundi)
#==================================================================================
userid=$(id -u)
if [ $userid -ne 0 ]; then
echo " Error is please run the script"
fi
dnf install mysql -y
