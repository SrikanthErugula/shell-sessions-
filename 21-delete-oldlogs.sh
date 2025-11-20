#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

SOURCE_DIR=/home/ec2-user/app_logs # Source_dir means ekkada numchi files  delete cheyali ani or which folder lo 
if [ ! -d $SOURCE_DIR ]; then # [ here -d $SOURCE_DIR ila iste dir vunte ichhina CMD excute avuthuni adhe  ( ! -d $SOURCE_DIR ila iste dir ledhu ani error print avuthundi) ]
    echo -e " $R ERROR : Source DIR $SOURCE_DIR doesn't exist $N"
    exit 1

fi
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= read -r SRI
do

    echo " Deleting the files : $SRI"
    rm -rf $SRI
    echo "Deleted the file: $SRI"


done <<< $FILES_TO_DELETE # here files ithe just one < symbol chalu but if u want give input then put <<< symbols