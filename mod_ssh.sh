#!/bin/bash
mod_ssh(){
	ls ssh_list/ | grep -n '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | tee ssh_list.txt
	read -p "Server ID:" CHOICE
	echo ""
	SSH_IP=`cat ssh_list.txt | grep "$CHOICE\:" | awk 'BEGIN{FS=":"}{print $2}'`
	SSH_PORT=`cat ssh_list/$SSH_IP | grep Port | awk 'BEGIN{FS=":"}{print $2}'`
	SSH_USER=`cat ssh_list/$SSH_IP | grep User | awk 'BEGIN{FS=":"}{print $2}'`
	NUMLN=`cat .ssh/known_hosts | grep -n $SSH_IP | awk 'BEGIN{FS=":"}{print $1}'`
	sed -i "$NUMLN d" .ssh/known_hosts
	read -p "New port:" SSH_NPORT
	read -p "New user:" SSH_NUSER

	sed -i "s/$SSH_PORT/$SSH_NPORT/g" ssh_list/$SSH_IP
	sed -i "s/$SSH_USER/$SSH_NUSER/g" ssh_list/$SSH_IP
	rm ssh_list.txt
	echo "$SSH_IP modified."
}
del_ssh(){
	ls ssh_list/ | grep -n '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | tee ssh_list.txt
	read -p "Server ID:" CHOICE
	SSH_IP=`cat ssh_list.txt | grep "$CHOICE\:" | awk 'BEGIN{FS=":"}{print $2}'`
	rm ssh_list/$SSH_IP
	NUMLN=`cat $HOME/.ssh/known_hosts | grep -n $SSH_IP | awk 'BEGIN{FS=":"}{print $1}'`
	sed -i "$NUMLN d" $HOME/.ssh/known_hosts
	rm ssh_list.txt
	echo "$SSH_IP deleted."
}

echo "1.Modify a ssh configuration"
echo "2.Delete a ssh configuration"
read -p "Your choice:" CHOICE
echo ""
case $CHOICE in
	"1")
		mod_ssh
		;;
	"2")
		del_ssh
		;;
	*)
		echo "Exciting..."
		exit 3
esac
