#!/bin/bash

# everything in shell is considerd as string
NUMBER1=100
NUMBER2=200
NAME=DevOps
# below is my own practice
#number1=2
#number2=4
#SUM=$(($number1+$number2))

SUM=$(($NUMBER1+$NUMBER2+$NAME)) # so ila run cheste only additon operation jarigi 300 print avuthunhi, name print avvadhu bcz it automatically shell anedhi think chesi wrong ichharu ani zero ga consider chesi print cheyadhu

echo "SUM is: ${SUM}"

# Size = 4, Max index = 3
LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"  
#echo "First Leader: ${LEADERS[10]}"