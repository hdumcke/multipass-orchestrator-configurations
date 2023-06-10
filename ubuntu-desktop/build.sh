#!/bin/bash

echo never | sudo tee /sys/kernel/mm/transparent_hugepage/enabled

sudo apt update
sudo apt install -y ubuntu-desktop xrdp
echo ubuntu:ubuntu | sudo chpasswd
