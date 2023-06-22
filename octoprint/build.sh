#!/bin/bash

sudo apt install -y python-is-python3

### Install pip
cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

cd ~/OctoPrint
pip install -U pyobjc
pip install .

octoprint serve
