#!/bin/bash
# anyone can call this script with arguements (mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE)

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all agruements" $@"

FINAL_BODY=$(sed -e 's/TEAM_NAME/DevOps Team/g' -e 's/ALERT_TYPE/High Disk Usage' -e "s/MESSAGE/$BODY" -e template.html)

#echo "$MESSAGE  Date $(date)" | mail -s "High Disk Usage Alert" info@mnyeruva.com

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS