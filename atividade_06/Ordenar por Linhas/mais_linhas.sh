#!/bin/bash
cd $1
for i in *.txt; do
	echo "$(wc -l < $i):$i" >> arq_linhas.log
done
cat arq_linhas.log | sort -n | cut -d ":" -f2
rm -r arq_linhas.log
cd ~/atividades/atividade_06
