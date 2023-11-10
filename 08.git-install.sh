 #!/bin/bash
 # install git

 USERID=$(id -u)

 if [ $USERID -ne 0 ]
 then
    echo "ERROR: Run this script with ROOT user"
    exit 1
 else   
    echo "This script successfully run by ROOT user"
  fi  

  yum install git -y

  if [ $? -ne 0 ]
  then
    echo "Installation of GIT is error"
    exit 1
  else
    echo "Installation of GIT is success"
  fi    

  # $?=0 it is success
  # $?= not 0 it is failure
  # echo $? 
  # exit 1