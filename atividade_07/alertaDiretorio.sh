#!/bin/bash

cd "$2"
sensorsLog="./dirSensors.log"
arquivos_anterior=$(ls)
qtd_anterior=$(echo "$arquivos_anterior" | wc -l)
while true; do
    sleep "$1"
    arquivos=$(ls)
    qtd=$(echo "$(ls)" | wc -l)
    if [ "$qtd_anterior" -ne "$qtd" ]; then
        arquivos_adc=""
        for arquivo in $arquivos; do
            if ! echo "$arquivos_anterior" | grep -q "$arquivo"; then
                arquivos_adc+="$arquivo, "
            fi
        done
        arquivos_rm=""
        for arquivo in $arquivos_anterior; do
            if ! echo "$arquivos" | grep -q "$arquivo"; then
                arquivos_rm+="$arquivo,"
            fi
        done
        mensagem="$(date "+[%d-%m-%Y %H:%M:%S]") alteração! $qtd_anterior->$qtd."
        if [ "$arquivos_adc" != "" ]; then
	    arquivos_adc=$(sed ",$" $arquivos_adc)
            mensagem_adc="$mensagem Adicionados: $arquivos_adc"
	    echo "$mensagem_adc"
            echo "$mensagem_adc" >> "$sensorsLog"
        fi
        if [ "$arquivos_rm" != "" ]; then
            mensagem_rm="$mensagem Removidos: $arquivos_rm"
	    echo "$mensagem_rm"
            echo "$mensagem_rm" >> "$sensorsLog"
	fi
        arquivos_anterior=$arquivos
        qtd_anterior=$qtd
    fi
done
