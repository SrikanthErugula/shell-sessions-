#!/bin/bash
#session 19

source ./common.sh
app_name=catalogue
application_setup
nodejs_setup
systemduser_setup

cp $SCRIPT_DIR/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Copy mongo repo"

dnf install mongodb-mongosh -y &>>$LOG_FILE
VALIDATE $? "Install MongoDB client"
#cp $SCRIPT_DIR/sri.repo /etc/nginx/nginx.conf &>>$LOG_FILE
#VALIDATE $? "sri repo copying "
INDEX=$(mongosh mongodb.daws86s.fun --quiet --eval "db.getMongo().getDBNames().indexOf('catalogue')") # ikkada catalogue anedhi linux cmd so we can't replace
if [ $INDEX -le 0 ]; then
mongosh --host $MONGODB_HOST </app/db/master-data.js &>>$LOG_FILE
VALIDATE $? "Load $app_name products"
else
   echo -e "$app_name products already loaded ... $Y SKIPPING $N"
fi

systemctl restart $app_name


print_total_time