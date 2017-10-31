echo "===================================================="
echo "===========INSTALACION DE JDK 8 ORACLE=============="
echo "===================================================="

#Se valida si eres root.
if [ "$LOGNAME" != "root" ]; then
	echo "ERROR: Debe ejecutar con el usuario root."
	exit 1
fi

echo "Agregando repositorios..."
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
echo "apt-get update"
apt-get update
echo "Instalando JDK 8..."
apt-get install oracle-java8-installer
echo "Fin de la instalación ;)"
