@echo off
cd bin
set OPENSSL_CONF=./openssl.cnf
openssl req -new -out qsvr.csr
openssl rsa -in privkey.pem -out qsvr.key
openssl x509 -in qsvr.csr -out qsvr.crt -req -signkey qsvr.key -days 365
set OPENSSL_CONF=
del .rnd
del privkey.pem
del qsvr.csr
move /y qsvr.crt ../etc/ssl.crt
move /y qsvr.key ../etc/ssl.key
echo 证书请到配置etc文件夹下查看.