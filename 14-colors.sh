#!/bin/bash

# Get the user ID
USERID=$(id -u)

# Define colors
R="\e[31m"  # Red - Error
G="\e[32m"  # Green - Success
Y="\e[33m"  # Yellow - Info/Warning
N="\e[0m"   # Reset color

# Check for root privilege
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR :: Please run this script with root privilege${N}"
    exit 1 # failure is non-zero
fi

# Validation function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "${R}ERROR :: Installing $2 failed.${N}"
        exit 1
    else
        echo -e "${G}SUCCESS :: Installed $2 successfully.${N}"
    fi
}

# MySQL installation
dnf list installed mysql &>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${Y}Installing MySQL...${N}"
    dnf install mysql -y &>/dev/null
    VALIDATE $? "MySQL"
else
    echo -e "${G}MySQL is already installed. Skipping...${N}"
fi

# Nginx installation
dnf list installed nginx &>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${Y}Installing Nginx...${N}"
    dnf install nginx -y &>/dev/null
    VALIDATE $? "Nginx"
else
    echo -e "${G}Nginx is already installed. Skipping...${N}"
fi

# Python3 installation
dnf list installed python3 &>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${Y}Installing Python3...${N}"
    dnf install python3 -y &>/dev/null
    VALIDATE $? "Python3"
else
    echo -e "${G}Python3 is already installed. Skipping...${N}"
fi










# #!/bin/bash

# USERID=$(id -u)

# R="\e[31m"
# G="\e[32m"
# y="\e[33m"
# N="\e[0m"


# if [ $USERID -ne 0 ]; then
#     echo -e "ERROR :: Please run this script with root privelege"
#     exit 1 #failure is other than 0
# fi

# VALIDATE(){
#     if [ $1 -ne 0 ]; then
#         echo -e "Error :: Installing $2 .... is $R Failure $N"
#         exit 1
#     else
#         echo -e "$G Installing $2 is success $N"
#     fi
# }

# dnf list installed mysql
# if [ $? -ne 0 ]; then
#     dnf install mysql -y
#     VALIDATE $? "MYSQL"
# else
#     echo -e "MySql already exist ... $G Skipping $N"
# fi


# dnf installed nginx
# if [ $? -ne 0 ]; then
#     dnf install nginx -y
#     VALIDATE $? "Nginx"
# else
#     echo -e "Nginx already exist ... $G Skipping $N"
# fi




# dnf installed python3
# if [ $? -ne 0 ]; then
#     dnf install python3
#     VALIDATE $? "python3"
# else
#     echo -e "python3 already installed... $G Skipping $N"
# fi