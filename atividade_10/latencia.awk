#!usr/bin/awk -f

{"ping -f -c 3 " $1 "| tail -n 1 | cut -d '/' -f5 "| getline atraso
print $1, atraso "ms"}

