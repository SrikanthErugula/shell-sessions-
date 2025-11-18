#!/bin/bash

AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-05184d3f3e9b3610f" # replace with your SG ID
ZONE_ID="Z0508801ITHFU9ARNA74" # replace with your ID
DOMAIN_NAME="dsoaws.fun"

for instance in $@ # mongodb redis mysql ala ivvali names
do
 Instaid=$(aws ec2 run-instances --image-id $AMI_ID  --instance-type t3.micro --security-group-ids $SG_ID  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query 'Instances[0].InstanceId' --output text) # single code vunte work avvadhu so andhuke "" ivvali at ResourceTyp
if [ $instance != "frontend" ]; then # frontend kakapothe will get private ip else frontend ite will get pubile ip 
    IP=$(aws ec2 describe-instances --instance-ids $Instaid  --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
    RECORD_NAME="$instace.$DOMAIN_NAME" #  bcz frontend kakapothe manaki ila kavali ex mongodb.dsoaws.fun
else
    IP=$(aws ec2 describe-instances --instance-ids $Instaid  --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
    RECORD_NAME="$DOMAIN_NAME" # daws86s.fun bcz frontend ithe manaki only ip address chalu 
fi
echo " $instance : $IP "

### records update cheyali 
aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \
    --change-batch '
    {
        "Comment": "Updating record set"
        ,"Changes": [{
        "Action"              : "UPSERT"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$RECORD_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP'"
            }]
        }
        }]
    }
    '
done