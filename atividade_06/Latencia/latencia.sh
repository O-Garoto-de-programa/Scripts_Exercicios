#!/bin/bash

for i in $(grep "" $1); do
	echo "$i $(ping -c 3 $i | sed -n '$p' | cut -d "/" -f5) ms" >> ips.txt

done

cat ips.txt | sort -n -k2

rm -r ips.txt
