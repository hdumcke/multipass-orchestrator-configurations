#!/bin/bash

sudo apt install -y python-is-python3

### Install pip
cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

git clone https://github.com/gumyr/build123d.git
cd build123d
python3 -m pip install -e .

cd ~
git clone https://github.com/bernhard-42/three-cad-viewer.git
