#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Error: debes proporcionar un directorio como parámetro"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "Error: el directorio no existe"
    exit 1
fi

for file in $1/*
do

if [ ${file##*.} == "txt" ]
    then
        rm $file
    fi
done

echo "Borrado de ficheros .txt completado"