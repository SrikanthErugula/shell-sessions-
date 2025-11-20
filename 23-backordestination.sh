#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
C="\e[36m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if not provided considered as 14 days ${3 enhuku ante above lo series ga istunnam like $1 and $2 ala}

 LOGS_FOLDER="/var/log/shell-script"
 SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
 LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
 #LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

# here backup purpose kabbatti adimstration access kavali server access so we need to the bewlo script 
if [ $USERID -ne 0 ]; then
    echo -e "ERROR:: $C Please run this script with root privelege $N"
    exit 1 # failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

### Check SOURCE_DIR and DEST_DIR passed or not ####
if [ $# -lt 2 ]; then
    USAGE
fi

### Check SOURCE_DIR Exist ####
if [ ! -d $SOURCE_DIR ]; then 
     echo -e " $R Source DIR $SOURCE_DIR doesn't exist $N"
     exit 1
fi

### Check DEST_DIR Exist ####
if [ ! -d $DEST_DIR ]; then 
     echo -e " $R Source DIR $DEST_DIR doesn't exist $N"
     exit 1
fi

### Find the files ####
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

### checking the folders status it means files exist or not 
if [ ! -z "${FILES}" ]; then
    ### Start Archeiving ###
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@  "$ZIP_FILE_NAME"

else
    echo -e " No fiels Existed or archive .... $Y SKIPPING $N "
fi