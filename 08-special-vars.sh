#!/bin/bash

echo "all variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo $0

echo "Current Directory : $PWD"
echo "who is running this $USER"
echo "home directory of user : $HOME"
echo "Pid of this script : $$"

sleep 50 &

echo "PID if the last command in background is : $!"

