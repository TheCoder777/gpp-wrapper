#!/bin/bash

# CRED='\033[31m' #alternative colors
# CGREEN='\033[32m'
# CBLUE2='\033[94m'

CBOLD='\033[1m'
CITALIC='\033[3m'
CRED2='\033[91m'
CGREEN2='\033[92m'
CEND='\033[0m'

if [ -z "$1" ]; then #if no args given
	echo -e "comp [file] [options]\n"
	echo "type: '-h' or '--help' for more info!"
	exit
fi

if [ "$1" == "-h" -o "$1" ==  "--help" ]; then #help
    echo -e "${CBOLD}Usage:${CEND}\n"
    echo "comp [file] [options]\n"
    echo -e "${CITALIC}The options are passed to g++ compiler!${CEND}"
    exit

else
    file=$1
    shift
    args=$@
	if [ ! -f ${file} ]; then #if first given arg is not a file
    	g++ $file $args
    	exit
	elif [ -f $file ]; then #if file specified
		echo -n "compiling... "
		out=$(g++ $file $args)
		if [ ! $? == 0 ]; then
		    echo -e "${CRED2}${CBOLD}Build failed!${CEND}"
			exit
		else
		    echo -e "${CGREEN2}${CBOLD}done!${CEND}"
			echo $out #output of compiler (g++)
		    echo -e "${CRED2}${CBOLD}out:${CEND}" #output of compiled programm
		    ./a.out #execute compiled file
		fi
	else
		echo -e "${CBOLD}${CRED2}File not found!${CEND}"
		exit
	fi
fi
