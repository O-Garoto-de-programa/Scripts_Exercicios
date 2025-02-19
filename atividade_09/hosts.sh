#!/bin/bash

File="./hosts.db"

adicionar() {
	echo "$1 $2" >> $File
}

remover() {
	sed -i "/$1/d" $File
}

listar() {
	cat $File
}

procurar() {
	case $1 in
		r)
		grep "$2" $File | cut -f 1 -d " "
		;;
		*)
		grep "$1" $File | cut -f 2 -d " "
		;;
	esac
}


nome=""
ip=""

while getopts a:i:r:d:l opcoes; do
	case $opcoes in
		a)
		   nome=$OPTARG
		   ;;
		i)
		   ip=$OPTARG
		   adicionar $nome $ip
		   ;;
		l)
		   listar
		   ;;
		d)
		   remover $OPTARG
		   ;;
		r)
		   procurar $opcoes $OPTARG
		   ;;
	esac
done

shift $((OPTIND-1))
if [ $1 ]
then
 procurar $1
fi
