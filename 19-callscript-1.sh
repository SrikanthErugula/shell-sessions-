#!/bin/bash
# 20-callscript-2 ni 19-callscript-1 lo call chese proccess is like as below

NAME=SRIKANTH
echo " Name is : $NAME"
echo " PID of Script-1 :: $$"

#sh 20-callscript-2.sh
source ./20-callscript-2.sh # instead of sh we need to use source and (.) dot represent current directory