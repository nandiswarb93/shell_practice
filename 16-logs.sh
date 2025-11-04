#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script Started executed at : $(date)"



if [ $USERID -ne 0 ]; then
    echo -e "ERROR :: Please run this script with root privelege"
    exit 1 #failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Error :: Installing $2 .... is $R Failure $N"
        exit 1
    else
        echo -e "$G Installing $2 is success $N"
    fi
}


dnf list installed mysql & >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y & >>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MySql already exist ... $Y Skipping $N"
fi


dnf list installed nginx & >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y & >>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y Skipping $N"
fi




dnf list installed python3 & >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 & >>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 already installed... $Y Skipping $N"
fi