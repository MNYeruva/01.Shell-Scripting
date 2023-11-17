#!/bin/bash
# anyone can call this script with arguements (mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE)

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
echo "escaped content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all agruements" $@"

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/MESSAGE/$BODY/g" -e template.html)

#echo "$MESSAGE  Date $(date)" | mail -s "High Disk Usage Alert" info@mnyeruva.com

echo "$FINAL_BODY" | mail -s $"(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"