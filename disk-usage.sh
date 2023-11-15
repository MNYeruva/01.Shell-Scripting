#!/bin/bash
#colors
#validations
#log redirections

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G=="\e[32m"
N=="\e[0m"
Y=="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
MESSAGE=


#IFS= means interna field seperator
while IFS= read line
do
    #This command will give you usage of in number format for comparision
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f1)
    #This command will give us partition
    PARTITION=$(echo $line | awk '{print $1}')
    # Now we need to check whether it is more than threshold or not
    if [ $USAGE -gt DISK_USAGE_THRESHOLD ];
    then
        MESSAGE+="High Disk Usage ON $PARTITION:$USAGE"
    fi    
done >>> $DISK_USAGE

echo "$MESSAGE"