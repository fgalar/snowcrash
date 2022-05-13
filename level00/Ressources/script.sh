#!/bin/bash
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level00@$1
SSHPORT=4242
PASSWORD=level00

ssh_connexion="sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT"

if [ $# -eq 1 ]; then
	# FIND the first file who can run only as flag00
	path=$(sshpass -p $PASSWORD ssh -q $HOST -p $SSHPORT '
		find / -user flag00 -group flag00 2>/dev/null -print | head -n 1
	')

	if [ $path ]; then

		echo "[+] Find readable file by flag00 : $path"

		# COPY content in local for rot15 conversion
		file=token
		if  [ ! -f $file ]; then
			sshpass -p $PASSWORD scp -q -P $SSHPORT $HOST:$path $file
			chmod a+r $file
			echo "[+] file imported."
		fi

		printf "\tFile content: $(cat $file)\n"
		echo "[+] Content conv: $(ruby $MY_PATH/rot15.rb $(cat $file))"

		rm -f $file
	fi
	
else
	printf "usage: ./script.sh [host]\n\texample [host] - 192.168.1.128"
fi
