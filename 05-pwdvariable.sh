#!/bin/bash
# session 15
# so here sometimes in somewhere it is asking to enter pin nukber like ATM... etc so for that we need to set [pin_number]
# cmd is read -s (only read iste manam enter chesina pwd visible avuthundhi so ala kakunda -s iste it wont visible to us)

echo "Please enter your PIN number"
read -s PIN_NUMBER # here PIN_NUMBER is variable

echo "PIN entered is: $PIN_NUMBER"