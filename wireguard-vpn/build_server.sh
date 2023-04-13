#!/bin/bash

sudo apt update
sudo apt install -y wireguard

wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

