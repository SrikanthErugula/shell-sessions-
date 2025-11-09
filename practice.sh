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
if [ $Sri -lt 35 ]; then
    echo " Srikanth got score $Sri so PASS "
#elif [ $Sri -eq 100 ]; then
    #echo " The Given Number $Sri is 0 number"

else 
    echo " Srikanth got score $Sri so FAIL"
fi
