#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level06@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level05/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD scp -q -P $SSHPORT $MY_PATH/var_x.txt $HOST:/tmp/.

	# ssh
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<ENDSSH
	./level06 /tmp/var_x.txt 
	rm /tmp/var_x.txt
ENDSSH

else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
