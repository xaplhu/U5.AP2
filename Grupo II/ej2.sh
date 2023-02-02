#!/bin/bash

precipitaciones=$(cat precipitaciones.txt)
dias_sin_lluvia=""
num_lineas=$(echo "$precipitaciones" | wc -l)

for ((i=1; i<=num_lineas; i++)); do
precipitacion=$(echo "$precipitaciones" | head -$i | tail -1 | awk '{print $2}')

if [ $precipitacion -eq 0 ]; then
dia=$(((i - 1) % 7 + 1))
    dias_sin_lluvia="$dias_sin_lluvia $dia"

  fi

done
echo "Los días que no llovió son:$dias_sin_lluvia"