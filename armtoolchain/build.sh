#!/bin/bash

sudo apt install -y make
wget -O  ~/arm-none-eabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=95edb5e17b9d43f28c74ce824f9c6f10&hash=176C4D884DBABB657ADC2AC886C8C095409547C4
cd ~
/usr/bin/tar -xf ~/arm-none-eabi.tar.xz -O arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi
cd ~/linorobot2_hoverboard/GD32-hover-master-slave/
make GCC_PATH=~/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin
mkdir ~/slave
cp build/firmware.bin ~/slave/
sed -i "s/\/\/#define MASTER/#define MASTER/" Inc/config.h
sed -i "s/#define SLAVE/\/\/#define SLAVE/" Inc/config.h
mkdir ~/master
cp build/firmware.bin ~/master/
