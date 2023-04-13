#!/bin/bash

sudo apt update
sudo apt install -y wireguard

wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

# allow ipv4 forwarding
sudo sed -i "s/#net.ipv4.ip_forward/net.ipv4.ip_forward/" /etc/sysctl.conf

sudo cp multipass-orchestrator-configurations/wireguard-vpn/wg0.conf /etc/wireguard/

sudo chmod 600 /etc/wireguard/{privatekey,wg0.conf}
