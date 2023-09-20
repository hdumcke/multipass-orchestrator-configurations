#!/bin/bash

sudo apt update
sudo apt -y upgrade

cat ~/multipass-orchestrator-configurations/lab-env/keys.txt >>  ~/.ssh/authorized_keys
