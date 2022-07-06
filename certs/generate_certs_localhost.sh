#!/bin/bash

#openssl req  -x509 -nodes -new -keyout server.key -out server.crt -days 3650 -subj "/C=/ST=/L=/O=/OU=wordpress/CN=localhost"
#openssl req  -x509 -nodes -new -outform pem -out certs/chain.pem -keyout certs/privkey.pem -days 3650 -subj "/C=/ST=/L=/O=/OU=wordpress/CN=local.wordpress.dev"

#cat certs/chain.pem > certs/fullchain.pem


sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout certs/$1/nginx-selfsigned.key -out certs/$1/nginx-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=wordpress-$1/CN=localhost"
sudo openssl dhparam -out certs/$1/dhparam.pem 2048

