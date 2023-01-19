===============
OTA Certificates
================

Based on https://jamielinux.com/docs/openssl-certificate-authority/index.html

Usage
-----

First time usage
^^^^^^^^^^^^^^^^

root ca:

openssl genrsa -aes256 -out ~/ca/private/ca.key.pem 4096
chmod 400 ~/ca/private/ca.key.pem
openssl req -config ~/ca/openssl.cnf -new -x509 -days 7300 -sha256 -extensions v3_ca -key ~/ca/private/ca.key.pem -sha256 -out ~/ca/certs/ca.cert.pem
openssl x509 -noout -text -in ca/certs/ca.cert.pem

intermediate ca:

openssl genrsa -aes256 -out ~/ca/intermediate/private/intermediate.key.pem 4096
chmod 400 ~/ca/intermediate/private/intermediate.key.pem
openssl req -config ~/ca/intermediate/openssl.cnf -new -sha256 \
      -key ~/ca/intermediate/private/intermediate.key.pem \
      -out ~/ca/intermediate/csr/intermediate.csr.pem
openssl ca -config ~/ca/openssl.cnf -extensions v3_intermediate_ca \
      -days 3650 -notext -md sha256 \
      -in ~/ca/intermediate/csr/intermediate.csr.pem \
      -out ~/ca/intermediate/certs/intermediate.cert.pem
openssl x509 -noout -text \
      -in ~/ca/intermediate/certs/intermediate.cert.pem
openssl verify -CAfile ~/ca/certs/ca.cert.pem \
      ~/ca/intermediate/certs/intermediate.cert.pem

cat ~/ca/intermediate/certs/intermediate.cert.pem \
      ~/ca/certs/ca.cert.pem > ~/ca/intermediate/certs/ca-chain.cert.pem
chmod 444 ~/ca/intermediate/certs/ca-chain.cert.pem

Save CA
^^^^^^^

./tools/save_ca.sh

Create host certificates
^^^^^^^^^^^^^^^^^^^^^^^^

SUBJECT=ota.marlysys.com

openssl genrsa -out ~/ca/intermediate/private/$SUBJECT.key.pem 2048
chmod 400 ~/ca/intermediate/private/$SUBJECT.key.pem

cat ~/ca/intermediate/openssl.cnf > /tmp/openssl.cnf
printf "\n[SAN]\nsubjectAltName=DNS:$SUBJECT" >> /tmp/openssl.cnf

openssl req -reqexts SAN \
      -extensions SAN \
      -subj "/C=FR/ST=Paris/O=Marlysys/CN=$SUBJECT" \
      -config /tmp/openssl.cnf \
      -key ~/ca/intermediate/private/$SUBJECT.key.pem \
      -new -sha256 -out ~/ca/intermediate/csr/$SUBJECT.csr.pem
openssl req -text -noout -verify \
      -in ~/ca/intermediate/csr/$SUBJECT.csr.pem      

openssl ca -config ~/ca/intermediate/openssl.cnf \
      -extensions v3_req \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in ~/ca/intermediate/csr/$SUBJECT.csr.pem \
      -out ~/ca/intermediate/certs/$SUBJECT.cert.pem
chmod 444 ~/ca/intermediate/certs/$SUBJECT.cert.pem
openssl x509 -noout -text \
      -in ~/ca/intermediate/certs/$SUBJECT.cert.pem
openssl verify -CAfile ~/ca/intermediate/certs/ca-chain.cert.pem \
      ~/ca/intermediate/certs/$SUBJECT.cert.pem

