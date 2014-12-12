#!/bin/bash

#création des fichiers pour le CA Root
mkdir -p ca/newcerts
touch ca/index.txt
echo '01' > ca/serial

# création des fichiers pour le CA SSL
mkdir -p cassl/newcerts
touch cassl/index.txt
echo '01' > cassl/serial

#Création du certificat CA (autosigné)
openssl genrsa -out ca/ca.key -des3 2048
openssl req -new -x509 -key ca/ca.key -out ca/ca.pem -config ./openssl.cnf -extensions CA_ROOT

#Création du certificat fille
openssl genrsa -out cassl/cassl.key -des3 2048
openssl req -new -key cassl/cassl.key -out cassl/cassl.csr -config ./openssl.cnf
openssl ca -out cassl/cassl.pem -config ./openssl.cnf -extensions CA_SSL -infiles cassl/cassl.csr

###### SERVEUR
#création des cléfs non signés
openssl genrsa -out cassl/serveurssl.key -des3 1024
openssl req -new -key cassl/serveurssl.key -out cassl/cassl.csr -config ./openssl.cnf

#signature via l'authorité fille (cassl.pem)
openssl ca -out cassl/serveurssl.pem -name CA_ssl_default -config ./openssl.cnf -extensions SERVER_RSA_SSL -infiles cassl/clientssl.csr

###### CLIENT
#création des cléfs non signés
openssl genrsa -out cassl/clientssl.key -des3 1024
openssl req -new -key cassl/clientssl.key -out cassl/cassl.csr -config ./openssl.cnf

#signature via l'authorité fille (cassl.pem)
openssl ca -out cassl/clientsslssl.pem -name CA_ssl_default -config ./openssl.cnf -extensions CLIENT_RSA_SSL -infiles cassl/clientssl.csr

# conversion en P12
openssl pkcs12 -export -inkey cassl/clientssl.key -in cassl/clientssl.pem -out clientssl.p12 -name "Certificat client"

openssl pkcs12 -export -inkey cassl/serveurssl.key -in cassl/serveurssl.pem -out serveurssl.p12 -name "Certificat Serveur"