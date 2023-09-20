#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F)
LOGSDIR=/home/centos/shell-script
# /home/centos/shell-script/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log


FILES_TO_DELTE=$(fine $APP_LOGS_DIR -name "*.log" -type f -ntime +14)

echo "$FILES_TO_DELETE"

while read line
do
    echo "Deleting $line" &> $LOGFILE
    rm -rf $line
done < $FILES_TO_DELTE