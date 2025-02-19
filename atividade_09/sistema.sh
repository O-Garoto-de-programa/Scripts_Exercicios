#!/bin/bash

tempoLigado(){
	clear
	uptime
	sleep 3
	read -p "PRESSIONE ENTER PRA VOLTAR PARA O MENU" enter
	menu
}

ultimasMensagens(){
	clear
	dmesg | tail -n 10
        read -p "PRESSIONE ENTER PRA VOLTAR PARA O MENU" enter
        menu
}

memoriaVirtual(){
	clear
        vmstat 1 10
        read -p "PRESSIONE ENTER PRA VOLTAR PAR O MENU" enter
        menu
}


usoCPUNucleos(){
	clear
        mpstat -P ALL 1 5
        read -p "PRESSIONE ENTER PRA VOLTAR PARA O MENU" enter
        menu
}

usoCPUProcessos(){
	clear
        pidstat 1 5
        read -p "PRESSIONE ENTER PRA VOLTAR PARA O MENU" enter
        menu
}

usoMemoriaFisica(){
	clear
        free -m
        read -p "PRESSIONE ENTER PRA VOLTAR PARA O MENU" enter
        menu
}


menu() {
	clear
        echo "#----------------------------------#"
        echo "|               MENU               |"
        echo "|                                  |"
        echo "| 1. Tempo ligado                  |"
        echo "| 2. Últimas mensagens do kernel   |"
        echo "| 3. Memória Virtual               |"
        echo "| 4. Uso da CPU por núcleo         |"
        echo "| 5. Uso da CPU por processos      |"
        echo "| 6. Uso da Memória Física         |"
        echo "| 7. Sair                          |"
        echo "#----------------------------------#"

        read -p "Escolha uma opção: " opt

        case $opt in

                1) tempoLigado ;;
                2) ultimasMensagens ;;
                3) memoriaVirtual ;;
                4) usoCPUNucleos ;;
                5) usoCPUProcessos ;;
                6) usoMemoriaFisica ;;
                7) exit ;;
                *) echo "Digite o número de uma das Opções" ; sleep 2; menu ;;

	esac
}

menu
