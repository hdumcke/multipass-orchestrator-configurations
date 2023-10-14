#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt -y install python3-venv build-essential gdb clang-format

python -mvenv dev
source dev/bin/activate
pip install coverage

cat ~/multipass-orchestrator-configurations/TeamCdR2024/keys.txt >>  ~/.ssh/authorized_keys
