#!/bin/bash

linux=0
windows=0
procesos_linux=0
procesos_windows=0

while read linea; do
  usuario=$(echo "$linea" | awk '{print $1}')
  sistema=$(echo "$linea" | awk '{print $2}')
  procesos=$(echo "$linea" | awk '{print $3}')

   if [ "$sistema" = "Linux" ]; then
    ((linux++))
    ((procesos_linux+=procesos))
  elif [ "$sistema" = "Windows" ]; then
    ((windows++))
    ((procesos_windows+=procesos))
  fi
done

echo "Número de usuarios con Linux: $linux"
echo "Número de usuarios con Windows: $windows"
echo "Total de procesos en Linux: $procesos_linux"
echo "Total de procesos en Windows: $procesos_windows"