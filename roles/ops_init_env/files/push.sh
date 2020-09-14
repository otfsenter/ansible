#!/usr/bin/sh

host=$1
src=$2
dst=$3


for IP in `cat $INVENTORY_HOME/$host`
do
	echo $IP
	scp -prq -l 409600 -o ConnectTimeout=3 -o ConnectionAttempts=3 -o StrictHostKeyChecking=no $src $IP:$dst
done 2>&1
