#!/bin/bash
if [ ! "$1" ] || [ ! "$2" ] || [ ! "$3" ];then
	cat <<- EOF
	Usage: bash ftp_ssh.sh [u(upload)|d(download)] [Source File] [Destination]
	EOF
	exit 1
fi
SSH_LIST=`ls ssh_list/ | grep -n '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
MAXNUM=$(($(ls -al ssh_list/ | wc -l) - 2))
echo -e "$SSH_LIST\n"
read -p "Server ID:" CHOICE

if [ "$CHOICE" -gt 0 ] && [ "$CHOICE" -lt "$MAXNUM" ]
then
	SSH_IP=`echo -e "$SSH_LIST\n" | grep "$CHOICE\:" | awk 'BEGIN{FS=":"}{print $2}'`
	SSH_PORT=`cat ssh_list/$SSH_IP | grep Port | awk 'BEGIN{FS=":"}{print $2}'`
	SSH_USER=`cat ssh_list/$SSH_IP | grep User | awk 'BEGIN{FS=":"}{print $2}'`

	case $1 in 
		"u")
			scp -r -P $SSH_PORT $2 $SSH_USER@$SSH_IP:$3
			;;
		"d")
			scp -r -P $SSH_PORT $SSH_USER@$SSH_IP:$2 $3
			;;
		*)
			echo "Worng operation choice!"
			echo "Exiting..."
			exit 2
			;;
	esac
else
	echo "Error choice!"
	echo "Exiting..."
	exit 3
fi
exit 0
