#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
LOGSDIR=/home/centos/shell-script
# /home/centos/shell-script/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

if [ $USERID -ne 0 ];
then 
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then   
        echo -e "Installing $2 .. $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 .. $G SUCCESS $N"
    fi

}

# all args are in $@
for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? is -ne 0 ];
    then
        echo "$i is not installed, let's install it"
        yum install $i -y2 &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi

    #yum install $i -y
done