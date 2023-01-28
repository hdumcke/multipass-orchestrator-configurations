#!/bin/bash

/usr/bin/tar -xf ~/arm-none-eabi.tar.xz
cd ~/linorobot2_hoverboard/GD32-hover-master-slave/
make GCC_PATH=~/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin
