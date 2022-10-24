#!/bin/bash

sudo apt update
sudo apt-get install -y git wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
mkdir -p ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
./install.sh esp32s3
./install.sh all
cat > ~/export-esp-idf.sh << EOF
. ~/esp/esp-idf/export.sh
EOF
chmod +x ~/export-esp-idf.sh
