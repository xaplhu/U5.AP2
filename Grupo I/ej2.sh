#!/bin/bash

for num in $(cat numeros.txt); do
    let resto=$num%2

    if[ $resto -eq 0];then
      echo $num >> pares
    else
      echo $num >> impares
    fi
done

echo "PARES: Hay $(cat pares | wc -l)"
echo "-----"
cat pares
echo " "
echo "IMPARES: Hay $(cat impares | wc -l)"
echo "-----"
cat impares

rm -rf pares impares