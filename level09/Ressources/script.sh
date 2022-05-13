#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level09@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level08/flag)

if [ $# -eq 1 ]; then
	sshpass -p $PASSWORD scp -q -P $SSHPORT $HOST:token .
	echo "[+] Import token file."
	chmod +rw token
	echo "[+] Add position to bit."
	echo "content: $(cat token)"
	printf "convert: "
	$MY_PATH/reverse_bitPos.rb token
	rm -f token
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
