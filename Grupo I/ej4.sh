#!/bin/bash
#Las IP tienen la forma aaa.bbb.ccc.ddd
#Nos quedaremos con aaa.bbb.ccc de nuestra IP e iteraremos sobre ddd

#Obtengamos primero la IP de nuestra máquina
ipmaquina=$(ifconfig eth0 | grep -w "inet" | awk '{print $2}')

#Quedémonos solo con la parte fija aaa.bbb.ccc
aaa=$(echo $ipmaquina | awk -F '.' '{print $1}')
bbb=$(echo $ipmaquina | awk -F '.' '{print $2}')
ccc=$(echo $ipmaquina | awk -F '.' '{print $3}')
partefija=$(echo $aaa.$bbb.$ccc)

#Y ahora iteramos sobre ddd
#ddd va de 0 a 255, pero 0, 1 y 255 no son máquinas individuales
#así que iteramos de 2 a 254
for i in 'seq 2 254'; do
    # Hacemos ping de un solo paquete  a esa IP de red
    echo -n "Testeando $partefija.$i..."
    resultadoping=$(ping -c 1 $partefija.$i)
    #Comprobamos si ha respondido
    recibido=$(echo resultadoping | grep "1 received")

    if [ "$recibido" != ""];then
        echo "OK"
        echo "$partefija.$i" >> listado
      else
    echo "NOK"
  fi
done

echo "IPs conectadas:"
cat listado
rm -f listado