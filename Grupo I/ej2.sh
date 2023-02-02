#!/bin/bash

pares=0
impares=0

echo "Números pares:"
while read numero; do
  if [ $((numero % 2)) -eq 0 ]; then
    echo $numero
    ((pares++))
  fi
done < numeros.txt

echo "Números impares:"
while read numero; do
  if [ $((numero % 2)) -ne 0 ]; then
    echo $numero
    ((impares++))
  fi
done < numeros.txt

echo "Total de números pares: $pares"
echo "Total de números impares: $impares"