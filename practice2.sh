#!/bin/bash

sriuser=$(id -u)

if [ $sriuser -ne 0 ]; then
    echo " ERROR :: Please run this CMD with root user "
    exit 1
fi
dnf remove mysql -y
if [ $? -ne 0 ]; then
    echo " Install mysql is FAIL "
    exit 1
else
     echo " Install mysql is SUCCESS"
fi
