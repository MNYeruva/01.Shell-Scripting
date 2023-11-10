#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/centos/sjellscript-logs
#/home/centos/sjellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::Please run the script with ROOT user"
    exit 1
fi    

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e"Installing $2 ... $R Failure $N"
        exit 1
    else
        echo -e "Installing $2 ... $G Success $N"   
    fi     
}


for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed. let's install..."
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else    
        echo -e "$Y $i is already installed $N"
    fi
done