#!/bin/bash

#DATE=$(date)

#echo "Timestamp is: $DATE"


START_TIME=$(date +%s)

sleep 10 # So here (sleep 10 &) iste background loki sleep avuthundhi ala kakunda sleep 10 iste manaki foreground kanipistu excute avuthundi

END_TIME=$(date +%s) 

TOTAL_TIME=$(($END_TIME-$START_TIME)) 

echo "Script executed in: $TOTAL_TIME Seconds"
