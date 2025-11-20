#!/bin/bash
# session 20
# here same like for loop lage while loop kuda main diff is while loop files ni read cheyadiki baga use avuthundhi
# serach in google while loop cmds 

# while [ condition ]
# do
#   # Commands to be executed
# done

# Explanation:
# while [ condition ]: This initiates the while loop. The condition enclosed within the square brackets ([]) is evaluated. This condition can be a test on variables, the exit status of a command, or other expressions that evaluate to true or false.
# do: This keyword marks the beginning of the block of commands that will be executed repeatedly.
# # Commands to be executed: This represents the actual commands or statements that form the body of the loop. These commands will run as long as the condition in the while statement is true.
# done: This keyword marks the end of the while loop's command block.

# count=3

# echo "Starting countdown..."

# while [ $count -gt 0 ] # so ikkada 5 num 0 zero kante ekkuva so loop loki velli process start avvuthudi
# do
#   echo "Time left: $count"
#   sleep 1 # Pause for 1 second
#   count=$((count - 1)) # Decrement the count
# done

# echo "Times up!"

while IFS= read -r SRI; do # IFS stands for Internal Field Separator. it means by default line by line ni  proper ga  read chestudhi 
    # Process each line here
    echo "Processing line: $SRI"
    # Example: you can perform other operations with the $line variable
    # For instance:
    # some_command "$line"
    # if [[ "$line" == "specific_text" ]]; then
    #    echo "Found specific text!"
    # fi
 done < 19-callscript-1.sh #( here is file_name)

#  44.220.131.133 | 172.31.19.60 | t3.micro | https://github.com/SrikanthErugula/shell-sessions-.git
# [ ec2-user@ip-172-31-19-60 ~/shell-sessions- ]$ cd

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~ ]$ ls -l
# total 4
# drwxr-xr-x 4 ec2-user ec2-user 4096 Nov 20 05:42 shell-sessions-

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~ ]$ mkdir app_logs

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~ ]$ ls -l
# total 4
# drwxr-xr-x 2 ec2-user ec2-user    6 Nov 20 05:47 app_logs
# drwxr-xr-x 4 ec2-user ec2-user 4096 Nov 20 05:42 shell-sessions-

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~ ]$ cd app_logs/

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$ touch shiiping.logs

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$ touch -d 20240503 cart.logs

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$ ls -l
# total 0
# -rw-r--r-- 1 ec2-user ec2-user 0 May  3  2024 cart.logs
# -rw-r--r-- 1 ec2-user ec2-user 0 Nov 20 05:48 shiiping.logs

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$
# ====================================================
# --> get all logs from os old logs of 14 days

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ root@ip-172-31-19-60 ~ ]# find / -name "*.log" -mtime +14
# /home/ec2-user/app_logs/sri.log
# /var/log/dnf.log
# /var/log/dnf.librepo.log
# /var/log/dnf.rpm.log
# /var/log/hawkey.log
# /var/log/choose_repo.log
# /var/log/amazon/ssm/amazon-ssm-agent.log
# /var/log/amazon/ssm/errors.log
# /usr/lib/rpm/rpm.log

# -------------> get specific logs like as bewlow
# # find /home/ec2-user/app_logs -name "*.log" -mtime +14
# /home/ec2-user/app_logs/sri.log

# ------------> non root lo ithe like as below ( . dot means current dir ) 

# [ ec2-user@ip-172-31-19-60 ~/app_logs ]$ find . -name "*.log" -mtime +14
# ./sri.log

# -------------------> if u want know about the size the go here ( du means disk utilization)
# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ root@ip-172-31-19-60 ~ ]# du -sh /var/log/choose_repo.log
# 0       /var/log/choose_repo.log ( size is 0)

# 44.220.131.133 | 172.31.19.60 | t3.micro | null
# [ root@ip-172-31-19-60 ~ ]# du -sh /home/ec2-user/app_logs/sri.log
# 0       /home/ec2-user/app_logs/sri.log Size is 0

# [ root@ip-172-31-19-60 ~ ]# find / -name "*.log" -type f -size +4k ( size is 4k vunna anni kuda print ayyai) 
# /var/log/audit/audit.log
# /var/log/dnf.librepo.log
# /var/log/cloud-init.log

#  if [ ! -z "${FILES}" ]; then # (-z it works check to files are exist or not in folder if yes print the files found line or else if not print the no files are existed
#     echo " Files Found $FILES"
#     TIMESTAMP=$(date +%F-%H-%M) # idhi top lo kuda create chesukovachu like first 1 to 10 lines lo 
#     ZIP_FILE_NAME=" $DEST_DIR/app_logs_$TIMESTAMP.zip" # manam anukone file name sample file for reff.......... idhi top lo kuda create chesukovachu like first 1 to 10 lines lo ........ usually files zip chestunte adhi inko name tisukoni zip loki convert avuthai dhani overcome cheyadaniki zip file name rasam 
#     # zip cmd install lakapothe install chesi ee script ni run cheyali 

#     echo " zip file name is : $ZIP_FILE_NAME"
#     find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME" 
#      #( Here  vachhina files anni kuda zip loki velladaniki ee script formate...... zip -@ -j "$ZIP_FILE_NAME)

# #     [ ec2-user@ip-172-31-19-60 ~/shell-sessions- ]$ sudo sh 23-backordestination.sh /home/ec2-user/source-dir /home/ec2-user/source-dir
# # Script started executed at: Thu Nov 20 09:54:49 UTC 2025
# #  Files Found /home/ec2-user/source-dir/cart.log
# # /home/ec2-user/source-dir/user.log
# #  zip file name is :  /home/ec2-user/source-dir/app_logs_2025-11-20-09-54.zip
# # 23-backordestination.sh: line 61: zip: command not found

# # so ikkaada error vachhindhi 

#]$ rm -rf * ---> remove whole content inside 