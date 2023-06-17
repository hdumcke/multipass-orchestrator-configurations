#!/bin/bash

sudo apt update
sudo apt install -y ubuntu-mate-desktop xrdp firefox
echo ubuntu:ubuntu | sudo chpasswd
