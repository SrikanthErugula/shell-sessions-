#!/bin/bash

Number=$1
if [ $Number -lt 10 ]; then
    echo " the given number $Number is less then 10 "
elif [ $Number -eq 10 ]; then
    echo " the given number $Number is equal to 10 "
else 
    echo " the given number $Number is grater then 10 "
fi