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
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.1.0
# create git tag
cd ~/test-module
git tag v0.1.0
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.2.0
# create next git tag
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m 'second commit'
git tag v0.2.0
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.2.0 2nd
# create next git tag
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m '3rd commit'
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.3
# create next git tag
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m '4th commit'
git tag v0.3
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.3 2nd
# create next git tag
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m '5th commit'
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo 0.4
# create next git tag
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m '6th commit'
git tag v0.4
cd ~
pip install ~/test-module
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo our own versoning sheme
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
git add -A
git commit -m '7th commit'
PBR_VERSION=$(~/multipass-orchestrator-configurations/python-pbr/get-version.sh) pip install ~/test-module
cd ~
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module

echo ================
echo our own versoning sheme, make dirty
cd ~/test-module
sed -i -e "s/World/World\!/g" ~/test-module/test_module/test.py
PBR_VERSION=$(~/multipass-orchestrator-configurations/python-pbr/get-version.sh) pip install ~/test-module
cd ~
python3 ~/test-module/test/test.py
pip show test-module
pip freeze | grep test-module
pip uninstall -y test_module
