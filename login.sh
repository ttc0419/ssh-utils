#!/bin/bash
echo "Please select a host to connect:" >& 2

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

echo "Connecting to $ip..." >& 2
ssh -p $port $user@$ip $1
