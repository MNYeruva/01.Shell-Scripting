 #!/bin/bash
 # install git

 USERID=$(ID -U)

 if [ $USERID -ne 0 ]
 then
    echo "ERROR: Run this script wit ROOT user"
 else   
    echo "This script run by ROOT user"
  fi  

  yum install git -y