#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt install -y dnsmasq

cat ~/multipass-orchestrator-configurations/lab-env/keys.txt >>  ~/.ssh/authorized_keys
