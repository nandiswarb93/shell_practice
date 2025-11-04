#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run this script with root privelege"
    exit 1 #failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error :: Installing $2 is Failure"
        exit 1
    else
        echo "Installing $2 is success"
    fi
}


dnf install mysql -y

VALIDATE $? "MySql"


dnf install ngnix -y

VALIDATE $? "Nginx"


dnf install mongodb-mongosh -y

VALIDATE $? "mongosh"
