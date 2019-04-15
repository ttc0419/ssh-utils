#!/bin/bash
if [ -d ssh_list ]
then
	echo "Please input the following info"
else
	echo "ssh_list not exists,creating directory..."
	mkdir ssh_list
	echo "" > $HOME/.ssh/known_hosts
fi

read -p "Server ip:" IP
if [ ! $(echo $IP | grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") ];then
	echo "Wrong IPV4 format!"
	exit 4
fi
read -p "SSH port:" PORT
if [ ! $(echo $PORT | grep -E "[0-9]{1,4}") ] || [ "$PORT" -lt 0 ] || [ "$PORT" -gt 65536 ];then
	echo "Wrong port number!"
	exit 5
fi
read -p "Login user:" SSH_USER

echo "Port:$PORT" > ssh_list/$IP
echo "User:$SSH_USER" >> ssh_list/$IP

echo "$IP added."
