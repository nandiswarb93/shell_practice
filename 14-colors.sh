#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run this script with root privelege"
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

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "MySql already exist ... $G Skipping $N"
fi


dnf installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx already exist ... $G Skipping $N"
fi




dnf installed python3
if [ $? -ne 0 ]; then
    dnf install python3
    VALIDATE $? "python3"
else
    echo "python3 already installed... $G Skipping $N"
fi