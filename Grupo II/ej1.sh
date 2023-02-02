#!/bin/bash

precipitaciones=$(cat precipitaciones.txt)
total=0
num_lineas=$(echo "$precipitaciones" | wc -l)
for linea in $precipitaciones; do
  total=$((total + $(echo "$linea" | awk '{print $2}')))
done
media=$((total / num_lineas))
echo "La media de precipitaciones es: $media litros"