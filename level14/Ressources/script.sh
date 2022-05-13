#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level14@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level13/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD scp -q -P $SSHPORT $MY_PATH/getflag.gdb $HOST:/tmp/.
	sshpass -p $PASSWORD ssh -q -T $HOST -p $SSHPORT<<SSHEND
		gdb --batch-silent /bin/getflag -x /tmp/getflag.gdb
SSHEND
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
