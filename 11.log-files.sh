 #!/bin/bash
 # install git
  DATE=$(date +%F)   #$(date +%F:%H:%M:%S)
  SCRIPT_NAME=$0
  LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
   # This Function should validate the previous command and inform user it is success OR failure
   VALIDATE(){
    #$1 ---> IT WILL RECEIVE THE ARGUMENT1
      if [ $1 -ne 0 ]
    then
        echo "$2... FAILURE"
        exit 1
    else
        echo "$2... SUCCESS"
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