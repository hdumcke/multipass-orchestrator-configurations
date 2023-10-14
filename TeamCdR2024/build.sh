#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt -y install python3-venv build-essential gdb clang-format cmake python3-dev nginx


python3 -mvenv dev
source dev/bin/activate
pip install coverage
pip install gcovr

cat ~/multipass-orchestrator-configurations/TeamCdR2024/keys.txt >>  ~/.ssh/authorized_keys

# Highly insecure, use only for local VM
sudo sed -i "s|/var/www/html|/home/ubuntu|" /etc/nginx/sites-enabled/default
sudo sed -i "/404\./a autoindex on;" /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
sudo chown -R ubuntu.www-data /home/ubuntu
