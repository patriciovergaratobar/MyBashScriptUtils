#!/bin/bash

if [ ! -z $(ip address | grep global | grep wl | awk -Fglobal '{print $NF}') ]; then
        echo "WIFI"
elif [ ! -z $(ip address | grep global | grep eth |  awk -Fglobal '{print $NF}') ]; then
	echo "ETHERNET"
elif [ ! -z  $(ip address | grep global | grep ppp | awk -Fglobal '{print $NF}') ]; then
	echo "GPRS"
else
        echo "NO_RED"
fi
