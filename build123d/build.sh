#!/bin/bash

sudo apt install -y python-is-python3 libgl1 qtbase5-dev qt5-qmake

### Install pip
cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

pip install git+https://github.com/jdegenstein/jmwright-CQ-Editor
pip install --pre cadquery

cd ~
git clone https://github.com/gumyr/build123d.git
cd build123d
python3 -m pip install -e .

cd ~
git clone https://github.com/bernhard-42/three-cad-viewer.git

cd ~
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y --no-install-recommends yarn

cd ~/three-cad-viewer
yarn install
#yarn run start
