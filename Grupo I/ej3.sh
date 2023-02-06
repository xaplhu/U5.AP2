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
    linux=$((linux+1))
    procesos_linux=$((procesos_linux+procesos))
  else
    windows=$((windows+1))
    procesos_windows=$((procesos_windows+procesos))
  fi
done < listado.txt

echo "Linux=> $linux usuarios y $procesos_linux procesos"
echo "Windows=> $windows usuarios y $procesos_windows procesos"
