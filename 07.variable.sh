#!/bin/bash
#Given number greaterthan 100 or not
NUMBER=$1
if [ $NUMBER -gt 100 ]
then 
    echo "$NUMBER is greaterthan 100"
else
    echo "$NUMBER is not greaterthan 100"
fi