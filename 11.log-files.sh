 #!/bin/bash
 # install git
  DATE=$(date +%F)   #$(date +%F:%H:%M:%S)
  SCRIPT_NAME=$0
  LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

 #Colors vars
 R="\e[31m" 
 G="\e[31m"
 N="\e[0m"

   # This Function should validate the previous command and inform user it is success OR failure
   VALIDATE(){
    #$1 ---> IT WILL RECEIVE THE ARGUMENT1
      if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILURE $N"
        exit 1
    else
        echo -e "$2... $G SUCCESS $N"    #\e[31m --> With color enabling...
    fi  
 }

 USERID=$(id -u)
 
 if [ $USERID -ne 0 ]
 then
    echo "ERROR: Run this script with ROOT user"
    exit 1
 else   
    echo "This script successfully run by ROOT user"
  fi  

  yum install git -y &>>$LOGFILE

    VALIDATE $? "Installing GIT"

  yum install mysql -y &>>$LOGFILE

    VALIDATE $? "Installing MYSQL"