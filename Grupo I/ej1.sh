#!/bin/bash

if [ $# -ne 1 ] || [$1 -le 0]; then
  echo "Debes ejecutar el script como: $0 n"
  echo "Donde n es un número mayor que 0"
  exit
fi

while read nombre; do
  mkdir $nombre
  X=1
  while [ $X -le $1]; do
      mkdir "$nombre/personal$X"
      #X=$((X+1))
      ((X++))
  done
done < nombres.txt