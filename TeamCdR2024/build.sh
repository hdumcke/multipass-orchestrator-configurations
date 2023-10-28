#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt -y install python3-venv build-essential gdb clang-format cmake python3-dev nginx libirrlicht1.8 libirrlicht-dev

python3 -mvenv dev
source dev/bin/activate
pip install coverage
pip install gcovr

cat ~/multipass-orchestrator-configurations/TeamCdR2024/keys.txt >>  ~/.ssh/authorized_keys

wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.3.2/gcm-linux_amd64.2.3.2.deb
sudo apt-install -y -f ./gcm-linux_amd64.2.3.2.deb
git-credential-manager configure
git config --global credential.credentialStore plaintext

# Highly insecure, use only for local VM
sudo sed -i "s|/var/www/html|/home/ubuntu|" /etc/nginx/sites-enabled/default
sudo sed -i "/404\./a autoindex on;" /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
sudo chown -R ubuntu.www-data /home/ubuntu
