#!/bin/bash
# session 16
#NUMBER=$1 # edhaina value bayata numchi istunte dhani manam ila cmd tho notify cheyali

#if [ $NUMBER -lt 10 ]; then
    #echo "Given number $NUMBER is less than 10"
#elif [ $NUMBER -eq 10 ]; then
    #echo "Given number $NUMBER is equal to 10"
#else
    #echo "Given number $NUMBER is greater than to 10"
#fi

# -gt ( greater than symbol)
# -eq (equal symbol)
# -ne (not equal)
#-lt less than

#practice 1

#number=$1 # idhi commect cheste the below 2 lines ni activate cheyali
#echo " Enter a number"
#read number

#if [ $number -lt 10 ] ; then
 #   echo " Given number is $number less then 10"
#else
 #   echo "Givem number $number is greater then 10"
  #  fi

#Practice 2

#echo " Enter a number"
#read num
#if [ $(($num % 2)) -eq 0 ]; then 
 #   echo " Given number $num is even "
#else
 #   echo " Given number $num is odd "
#fi

#Practice 3

#echo "Enter a Number"
#read num
#if [ $num -gt 10 ] && [ $num -lt 100 ]; then 
    #echo " The Given Number $num is within range"
#else 
    #echo " The given number $num is out of range"
#fi

# decision tisukovali ante manaki if condition kavali

echo "Enter a Number"
read num
if [ $(($num % 2)) -eq 0 ]; then
echo " The given $num is Prime Number"
else
echo " The given $num is Not a Prime Number"
fi


