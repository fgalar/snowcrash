#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level13@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level12/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD scp -q -P $SSHPORT $MY_PATH/cmp_je.gdb $HOST:/tmp/.
	sshpass -p $PASSWORD ssh -q -T $HOST -p $SSHPORT<<SSHEND
		echo "[+] Execute gdb script."
		gdb ./level13 -x /tmp/cmp_je.gdb | grep token
SSHEND
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
