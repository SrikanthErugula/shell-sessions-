#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/21-delete-oldlogs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE  # -a means append

SOURCE_DIR=/home/ec2-user/app_logs # Source_dir means ekkada numchi files  delete cheyali or which folder lo 

if [ ! -d $SOURCE_DIR ]; then   # see notes 
    echo -e " $R ERROR : Source DIR $SOURCE_DIR doesn't exist $N"
    exit 1

fi
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)


while IFS= read -r SRI  # insted of SRI we can give any name like path or line
do

    echo " Deleting the files : $SRI"
    rm -rf $SRI
    echo "Deleted the file: $SRI"


done <<< $FILES_TO_DELETE # here  one file ithe just one < symbol chalu,  but if u want take input via varible then <<< symbols

# this file execute with sudo access