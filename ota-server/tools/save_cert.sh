#/bin/bash

SUBJECT=ota.marlysys.com

rm -rf tmp/certs
mkdir -p /tmp/certs
cat ~/ca/intermediate/certs/$SUBJECT.cert.pem \
    ~/ca/intermediate/certs/ca-chain.cert.pem  > /tmp/certs/server.crt
cp ~/ca/intermediate/private/$SUBJECT.key.pem /tmp/certs/server.key
cd /tmp/certs
tar -zcf ~/certs.tar.gz .
openssl x509 -in ~/ca/certs/ca.cert.pem -inform PEM -out ~/dcso-ca.crt
