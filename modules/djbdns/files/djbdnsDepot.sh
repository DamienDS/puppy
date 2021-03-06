#!/bin/bash

################################################
############## SCRIPT PUPPET ###################
################################################
# Descritpion : ajout de dépots de paquets pour#
# 		Djbdns suivis d'un update      #
#Auteur : Lucas SOUPPE			       #
################################################ 


# Eregistrement de chaque lignes dans un tableau.
# i est une variable pour incrémenter le tableau

i=1
while read line
do
	tab[$i]=$line
	i=$(($i+1))
done < /etc/apt/sources.list

# Boucle pour parcourir chaque elements du tableau et conditions de verification pour ne pas ajouter une
# ligne deja existante
# firstDepot est la variable qui contiendra la premiere ligne du déport pour Djbdns
# secondDepot est pour le deuxieme dépot de Djbdns
# end sert à lire chaque elements du tableau
# Result sert pour le resultat final, si result = 1 alors on ajoute les depots si = 0 message d'erreur

firstDepot="deb http://smarden.org/pape/Debian sarge unofficial"
secondDepot="deb-src http://smarden.org/pape/Debian sarge unofficial"
end=1
result=1
while [ $end != $i ]
do
	if [ "${tab[$end]}" != "$firstDepot" ] && [ "${tab[$end]}" != "$secondDepot" ]
	then
		end=$(($end+1))
	else
		result=0
		break
	fi
done 

if [ $result -eq 0 ]
then
	echo "les depots que vous souhaitez ajouter sont déjà dans le fichier."
else
	echo "deb http://smarden.org/pape/Debian sarge unofficial" >> /etc/apt/sources.list
	echo "deb-src http://smarden.org/pape/Debian sarge unofficial" >> /etc/apt/sources.list
	apt-get update
fi

apt-get install djbdns daemontools ucspi-tcp <<INSTALL
y
y
INSTALL

#useradd -s /bin/false tinydns
#useradd -s /bin/false dnslog
ip=`ifconfig eth0 | sed "s/[[:space:]]/:/g" | grep inet:ad | cut -d: -f13`
echo $ip
tinydns-conf tinydns dnslog /etc/tinydns $ip
mkdir /service
ln -s /etc/tinydns /service/


