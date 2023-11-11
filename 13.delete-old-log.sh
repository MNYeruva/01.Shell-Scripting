#!/bin/bash

APP_LOGS_DIR=/home/centos/apps-logs

DATE=$(date +%F)   #$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/shellscript-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +30)

echo "$FILES_TO_DELETE"

#While LOOP

while read line 

do
    echo "Deleting $line" &> $LOGFILE    #we write our statements here..
done < $FILES_TO_DELETE   