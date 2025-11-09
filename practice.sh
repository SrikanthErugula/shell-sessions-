#!/bin/bash

Number=100
if [ $Number -lt 10 ]; then
    echo " the given number is less then 10 "
elif [ $Number -eq 10 ]; then
    echo " the given number is equal to 10 "
else 
    echo " the given number is grater then 10 "
fi