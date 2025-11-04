#!/bin/bash

USERID=$(ID -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run this script with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error :: Installing MySql is Failure"
else
    echo "Installing MySql is success"
fi