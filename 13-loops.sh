#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

#this function should validate the previous commond and inform user it is success or failure

VALIDATE(){
    #$1 --> it will receive the argument1
    if [ $1 -ne 0 ]
    then    
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else 
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

# all args are in $@
for i in $@
do 
    yum install $i -y &>>$LOGFILE
done