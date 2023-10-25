#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt -y install build-essential pkg-config flex bison

cat ~/multipass-orchestrator-configurations/TeamCdR2024/keys.txt >>  ~/.ssh/authorized_keys

git clone https://github.com/willamowius/ptlib.git

cd ptlib
./configure
make
sudo make install
cat >> /tmp/ptlib.conf << EOF
/usr/local/lib
EOF
sudo mv /tmp/ptlib.conf /etc/ld.so.conf.d/
sudo ldconfig


export PTLIBDIR=~/ptlib
cd samples/httptest
make
./obj_linux_x86_64/http

cd samples/url/
make
./obj_linux_x86_64/url http://127.0.0.1
