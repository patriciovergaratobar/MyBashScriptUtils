#!/bin/bash
echo "======================================"
echo "INICIANDO VALIDADOR DE CONEXIÓN WVDIAL"
echo "======================================"

#URL para testiar la conexion del GPRS
urlTest=www.google.com

#Funcion inicial del Script
runScript(){
        echo "#### Validando conexión..."
        ping -w 1 $1
        statusConexion=$?
        checkConnection $statusConexion
}

#Funcion que se encarga de reiniciar las tarjetas de Red
networkRestart(){
        #/etc/init.d/networking restart
        #Se reconfigura el WVDIAL en el caso que el GPRS cambie de puerto USB
        #WVDIAL para el GPRS
        echo "wvdialconf /etc/wvdial.conf"
    	sudo wvdialconf /etc/wvdial.conf
    	sudo echo "Carrier Check = no" >> /etc/wvdial.conf
    	sudo echo "Phone = *99#" >> /etc/wvdial.conf
    	sudo echo "Username = movistar" >> /etc/wvdial.conf
    	sudo echo "Password = movistar" >> /etc/wvdial.conf
    	echo "Iniciando WVDIAL... "
    	#Se ejecuta en segundo plano
    	sudo wvdial > /var/log/wvdial.log 2>&1 &
}

#Funcion que se encarga de comprobar si el equipo esta conectado
checkConnection(){
        if [ "$1" -eq "0" ]; then
                echo "#### Conexión OK"
        elif [ "$1" -eq "1" ]; then
                echo "#### Conexión Ok -  Pero con baja velocidad"
        else
                echo "#### ERROR de conexion"
                echo "#### Reiniciando Conexión GPRS"
                networkRestart
        fi
}

#Inicio del proceso de validacion
runScript $urlTest
