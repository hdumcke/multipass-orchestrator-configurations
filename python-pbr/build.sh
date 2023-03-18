#!/bin/bash

### Install pip
cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

### configure git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"


### Copy example code
cp -r ~/multipass-orchestrator-configurations/python-pbr/test-module ~/

### Test will fail because not a git repo
pip install ~/test-module

### test will pass once we created a git repo
cd ~/test-module
git init
git add -A
git commit -m 'first commit'
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip uninstall -y test_module

# create git tag
cd ~/test-module
git tag v0.1.0
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip uninstall -y test_module

# Next test will fail since git tag is > then version in setup.cdg
# create git tag
cd ~/test-module
git tag v0.2.0
cd ~
pip install ~/test-module
