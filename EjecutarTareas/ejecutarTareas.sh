#!/bin/bash
#Archivo que aloja las tareas
rutaLocal=$(realpath -s $0 | awk -F${0##*/} '{print $FNR}')
cd $rutaLocal

pendientes=TareasRoot
#Validacion para identificar si el script esta en ejecuciion
if [ -z $(cat ejecutandoRoot) ]; then
        #Si no esta en ejecucion ingresa por este flujo
        echo "1" > ejecutandoRoot
else
        #Si no esta en ejecucion no realiza nada y se detene.
        echo "" > ejecutandoRoot
        exit 0
fi

#Se recorren las lineas y se ejecutan
while read tarea
do
        echo "Ejecutando Tarea: "
        $tarea
done < $pendientes

#se limipia el archivo
echo "" >  $pendientes
echo "" > ejecutandoRoot

