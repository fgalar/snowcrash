#!/bin/bash

HOST=$1

if [ $# -eq 1 ]; then
	printf "\n__LEVEL00__\n"
	./level00/Ressources/script.sh 192.168.1.17	
	printf "\n__LEVEL01__\n"
	./level01/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL02__\n"
	./level02/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL03__\n"
	./level03/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL04__\n"
	./level04/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL05__\n"
	./level05/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL06__\n"
	./level06/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL07__\n"
	./level07/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL08__\n"
	./level08/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL09__\n"
	./level09/Ressources/script.sh 192.168.1.17

	# *** Bonus *** #
	printf "\n__LEVEL10__\n"
	./level10/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL11__\n"
	./level11/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL12__\n"
	./level12/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL13__\n"
	./level13/Ressources/script.sh 192.168.1.17
	printf "\n__LEVEL14__\n"
	./level14/Ressources/script.sh 192.168.1.17

else
	printf "usage: ./global.sh [host]\n\texample [host] - 192.168.1.128"
fi
