#!/bin/bash
if [ "$#" -ne 3 ];then
	echo "Usage: bash ftp_ssh.sh [u(upload)|d(download)] [Source File] [Destination]"
	exit 1
fi

ip=""
select ssh_ip in $(awk -F ',' '{print $1}' ssh-servers.csv);do
	ip=$ssh_ip
	break
done
if [ "$ip" == "" ];then
	echo "Error: The selected option is not valid"
	exit 2
fi

port=$(grep "^$ip," ssh-servers.csv | awk -F ',' '{print $2}')
user=$(grep "^$ip," ssh-servers.csv | awk -F ',' '{print $3}')

case $1 in 
	"u")
		scp -O -r -P $port $2 $user@$ip:$3
		;;
	"d")
		scp -O -r -P $port $user@$ip:$2 $3
		;;
	*)
		echo "Worng operation choice!"
		echo "Exiting..."
		exit 2
		;;
esac
