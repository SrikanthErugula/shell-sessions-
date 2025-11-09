#!/bin/bash

# everything in shell is considerd as string
NUMBER1=100
NUMBER2=200
NAME=DevOps
# below is my own practice
#number1=2
#number2=4
#SUM=$(($number1+$number2))

SUM=$(($NUMBER1+$NUMBER2+$NAME)) # so ila run cheste only additon operation jarigi 300 print avuthunhi,
# name print avvadhu bcz it automatically shell anedhi think chesi wrong ichharu ani zero ga consider chesi print cheyadhu

echo "SUM is: ${SUM}"

# ex 1
Add1=222
Add2=444

SUM=$(($Add1+$Add2))
echo "Totak sum is $SUM"

#ex 2
C=2345678765345678923456723456787654323456789876543
I=8765434567234567876543345678234567887654323456778
sum=$(($C+$I))
echo "SUM IS $sum"

# Size = 4, Max index = 3
LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"  #if u want specific name do like these......... number ela start avuthai 0 1 2 3 4 
#echo "First Leader: ${LEADERS[10]}" # usually error avstundhi bcz ikkada 10th position ledhu kabbati error is index not found ala 