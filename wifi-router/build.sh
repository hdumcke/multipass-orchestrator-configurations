#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo debconf-set-selections <<EOF
iptables-persistent iptables-persistent/autosave_v4 boolean true
iptables-persistent iptables-persistent/autosave_v6 boolean true
EOF

sudo apt install -y dnsmasq iptables-persistent

cat ~/multipass-orchestrator-configurations/lab-env/keys.txt >>  ~/.ssh/authorized_keys
sudo cp ~/multipass-orchestrator-configurations/wifi-router/dnsmasq.conf /etc
sudo cp ~/multipass-orchestrator-configurations/wifi-router/iptables.rules /etc/iptables/rules.v4

sudo sed -i "s/#DNSStubListener=yes/DNSStubListener=no/" /etc/systemd/resolved.conf
sudo sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/" /etc/sysctl.conf
