#!/bin/bash

sudo apt install -y make
wget -O  ~/arm-none-eabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=95edb5e17b9d43f28c74ce824f9c6f10&hash=176C4D884DBABB657ADC2AC886C8C095409547C4
##############################
# wait until wget has finished
##############################
tmp=$(ps aux | grep wget | grep arm-none-eabi.tar.xz | wc -l)
[ $tmp == "0" ] || echo "waiting for wget to finish"
while [ $tmp != "0" ];do
sleep 10;
echo -n "."
tmp=$(ps aux | grep wget | grep arm-none-eabi.tar.xz | wc -l)
done
/usr/bin/tar -xf ~/arm-none-eabi.tar.xz -C ~
sudo apt update
sudo apt -y upgrade	
sudo apt install -y libncurses5-dev openocd
echo "export PATH=~/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin:$PATH" >> ~/.bashrc
export PATH=~/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin:$PATH
cd ~/libopencm3
make TARGETS='stm32/f4'
cd ~/libopencm3-miniblink
make
cd ~/libopencm3-examples
cd examples/stm32/f4/nucleo-f411re/blink/
export OPENCM3_DIR=~/libopencm3
make
make flash

