#!/bin/bash

red="192.168.0."

echo "Direcciones IP conectadas en la red local:" > resultados.txt

for i in {1..255}; do
  direccion="$red$i"

  resultado=$(ping -c 1 "$direccion" | grep -o "1 received")
  
  if [ "$resultado" = "1 received" ]; then
    echo "$direccion" >> resultados.txt
  fi
done