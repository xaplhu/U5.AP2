#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 X"
  echo "Donde X es el número de subdirectorios a crear"
  exit 1
fi

X=$2

while read nombre; do
  mkdir "$nombre"
  cd "$nombre"
  for i in $(seq 1 "$X"); do
    mkdir "Personal$i"
  done
  cd ..
done < nombres.txt