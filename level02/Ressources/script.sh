#!/bin/sh
MY_PATH=$(dirname "$0")            # relative
MY_PATH=$(cd "$MY_PATH" && pwd)    # absolutized and normalized

HOST=level02@$1
PASSWORD=$(cat $MY_PATH/../../level01/flag)

if [ $# -eq 1 ]; then
	# [Import file]
	sshpass -p $PASSWORD scp -q -P 4242 $HOST:~/level02.pcap .
	chmod a+rwx level02.pcap
	echo "[+] Import PCAP file."

	# [In the TCP exchange the password is not crypted]
	printf "\tContents:\n"
	tshark -r level02.pcap -q -z follow,tcp,hex,0 | tail -n 28 | head -n 21
	tshark -r level02.pcap -q -z follow,tcp,hex,0 | tail -n 27 | head -n 21 | cut -d ' ' -f 3 > file.txt

	# [Intepret results]
	echo "[+] Conversion hexa to ascii:"
	$MY_PATH/hextoascii.rb file.txt
	
	# [Clean]
	rm file.txt level02.pcap
else
	printf "usage: ./script.sh [host]\n\t example [host]: 192.168.1.130"
fi
