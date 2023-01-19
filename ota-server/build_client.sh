#!/bin/bash

sudo cp ~/multipass-orchestrator-configurations/ota-server/ca.cert.pem /usr/local/share/ca-certificates/ca.cert.crt
sudo chmod 444 /usr/local/share/ca-certificates/ca.cert.crt
sudo update-ca-certificates
