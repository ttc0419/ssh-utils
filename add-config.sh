#!/bin/bash
read -p "Address:" ip

read -p "Port:" port
if [ -z "$port" ];then
	echo "Using standard SSH port: 22"
	port=22
elif [ "$port" -lt 0 ] || [ "$port" -gt 65536 ];then
	echo "Wrong port number!"
	exit 5
fi

read -p "Login User:" user

echo "$ip,$port,$user" >> ssh-servers.csv
echo "$ip added."
