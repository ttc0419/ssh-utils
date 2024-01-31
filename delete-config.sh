#!/bin/bash
ip=""
select ssh_ip in $(awk -F ',' '{print $1}' ssh-servers.csv);do
	ip=$ssh_ip
	break
done

grep -v "^$ip," ssh-servers.csv > ssh-servers.csv.new
mv ssh-servers.csv.new ssh-servers.csv

echo "$ip deleted."
