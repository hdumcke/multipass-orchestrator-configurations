#!/bin/bash

sudo apt update
sudo apt-get install -y git wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
mkdir -p ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
./install.sh esp32s3
./install.sh all
echo ". ~/esp/esp-idf/export.sh" >> ~/.bashrc
cd ~
git clone --recursive https://github.com/espressif/openocd-esp32.git
cd ~/openocd-esp32
sudo apt-get install -y libtool pkg-config texinfo zlib1g-dev libusb-1.0-0-dev
./bootstrap
./configure --includedir=/usr/include/libusb-1.0
make
sudo make install
