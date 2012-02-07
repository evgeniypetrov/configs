#!/bin/bash

server_name='inpath'
echo "generating keys for '$server_name' server"

#touch "$server_name.jpg"

echo '\n Generate a Private Key:'
echo 'openssl genrsa -des3 -out $server_name.key 1024'
openssl genrsa -des3 -out $server_name.key 1024

echo '\n Generate a CSR (Certificate Signing Request): '
echo 'openssl req -new -key $server_name.key -out $server_name.csr'
openssl req -new -key $server_name.key -out $server_name.csr

echo '\n Remove Passphrase from Key: '
echo 'cp $server_name.key server.key.org'
cp $server_name.key $server_name.key.org
echo 'openssl rsa -in $server_name.key.org -out $server_name.key'
openssl rsa -in $server_name.key.org -out $server_name.key

echo '\n Generating a Self-Signed Certificate: '
echo 'openssl x509 -req -days 365 -in $server_name.csr -signkey $server_name.key -out $server_name.crt'
openssl x509 -req -days 365 -in $server_name.csr -signkey $server_name.key -out $server_name.crt

# openssl genrsa -des3 -out server.key 1024
# openssl req -new -key server.key -out server.csr
# cp server.key server.key.org
# openssl rsa -in server.key.org -out server.key
# openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

