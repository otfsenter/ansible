#!/usr/bin/sh

host=$1
cmd=$2

for IP in `cat $INVENTORY_HOME/$host`
do
	echo $IP
	ssh -o ConnectTimeout=3 -o ConnectionAttempts=3 -o StrictHostKeyChecking=no $IP "$cmd" 2>/dev/null
done 2>&1