#!/bin/bash

read -p "Informe o arquivo: " file

sed -E "s/[[:punct:]]|[[:digit:]]//g" $file | tr "[A-Z]" "[a-z]"| sed $"s/ /\\n/g" |sed '/^$/d' |sort |uniq -c |sort -r | while read -r c w; do
	echo "$w: $c"
done
