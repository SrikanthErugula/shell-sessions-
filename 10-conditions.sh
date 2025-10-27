#!/bin/bash

NUMBER=$1 # edhaina value bayata numchi istunte dhani manam ila cmd tho notify cheyali

if [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is less than 10"
#elif [ $NUMBER -eq 10 ]; then
    #echo "Given number $NUMBER is equal to 10"
else
    echo "Given number $NUMBER is greater than to 10"
fi

# -gt ( greater than symbol)
# -eq (equal symbol)
# -ne (not equal)

#practice

#number=$1
#if [ $number -lt 10 ] then
    #echo " Given number is $number less then 10"
#else
   # echo "Givem number $number is greater then 10"
   # fi