#!/bin/bash
#shebang
NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is lass than 10"
elif [ $NUMBER -eq 10 ]; then
    echo "given Number $NUMBER is equal to 10"
elif [ $NUMBER -gt 10]; then
    echo "given Number $NUMBER is grater than to 10"
else
    echo "none"
fi


# -gt -eq -ne