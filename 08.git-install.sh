 #!/bin/bash
 # install git

 USERID=$(id -u)

 if [ $USERID -ne 0 ]
 then
    echo "ERROR: Run this script with ROOT user"
 else   
    echo "This script successfully run by ROOT user"
  fi  

  yum install git -y