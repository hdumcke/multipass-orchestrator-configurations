#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo debconf-set-selections <<EOF
iptables-persistent iptables-persistent/autosave_v4 boolean true
iptables-persistent iptables-persistent/autosave_v6 boolean true
EOF

sudo apt install -y dnsmasq iptables-persistent

cat ~/multipass-orchestrator-configurations/lab-env/keys.txt >>  ~/.ssh/authorized_keys
sudo cp ~/multipass-orchestrator-configurations/ota-server-rpi/dnsmasq.conf /etc
sudo cp ~/multipass-orchestrator-configurations/ota-server-rpi/iptables.rules /etc/iptables/rules.v4

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo rm /etc/resolv.conf
echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf

sudo sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/" /etc/sysctl.conf

echo "192.168.100.254 ota.marsattacks.com" | sudo tee /etc/resolv.conf

sudo reboot
