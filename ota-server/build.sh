#!/bin/bash

sudo apt-get install -y nginx
sudo sed -i "s/# listen/listen/" /etc/nginx/sites-available/default
sudo sed -i "s/listen 80/# listen 80/" /etc/nginx/sites-available/default
sudo sed -i "s/listen \[::\]:80/# listen [::]:80/" /etc/nginx/sites-available/default
sudo sed -i "s/# include snippets\/snakeoil.conf/include snippets\/my_certs.conf/" /etc/nginx/sites-available/default

sudo cp ~/multipass-orchestrator-configurations/ota-server/my_certs.conf /etc/nginx/snippets/
sudo cp ~/multipass-orchestrator-configurations/ota-server/server.crt /etc/ssl/certs/server.crt
sudo cp ~/multipass-orchestrator-configurations/ota-server/server.key /etc/ssl/private/server.key
sudo systemctl restart nginx
