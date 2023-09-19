#!/bin/bash

sudo apt-get update
cat ~/multipass-orchestrator-configurations/lab-env/keys.txt >>  ~/.ssh/authorized_keys
