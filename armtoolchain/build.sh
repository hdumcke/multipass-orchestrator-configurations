#!/bin/bash

sudo apt install -y make
wget -O  ~/arm-none-eabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=95edb5e17b9d43f28c74ce824f9c6f10&hash=176C4D884DBABB657ADC2AC886C8C095409547C4
cd ~
echo $(pwd)
echo $(ls -l /usr/bin/tar)
echo $(ls -l ~/)
sleep 2
echo $(ls -l ~/arm-none-eabi.tar.xz)
echo before
/usr/bin/tar -v -xf ~/arm-none-eabi.tar.xz
echo after
cd ~/linorobot2_hoverboard/Hoverboard-Firmware-Hack-Gen2/HoverBoardGigaDevice
make GCC_PATH=~/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin
mkdir ~/slave
cp build/firmware.bin ~/slave/
sed -i "s/\/\/#define MASTER/#define MASTER/" Inc/config.h
sed -i "s/#define SLAVE/\/\/#define SLAVE/" Inc/config.h
mkdir ~/master
cp build/firmware.bin ~/master/
