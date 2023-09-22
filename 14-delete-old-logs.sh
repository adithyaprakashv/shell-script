#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F-%H-%M-%S)
LOGSDIR=/home/centos/shell-script
# /home/centos/shell-script/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.LOG


FILES_TO_DELTE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE

while read line
do
    echo "Deleting $line" &>> $LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELTE