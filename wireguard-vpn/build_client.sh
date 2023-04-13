#!/bin/bash

sudo apt update
sudo apt install -y wireguard

# allow ipv4 forwarding
sudo sed -i "s/#net.ipv4.ip_forward/net.ipv4.ip_forward/" /etc/sysctl.conf
