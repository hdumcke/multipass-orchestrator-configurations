#!/bin/bash

cd ~
git clone -b mini_pupper_2 https://github.com/mangdangroboticsclub/mini_pupper_bsp.git
cd ~/mini_pupper_bsp/esp32
idf.py set-target esp32s3
idf.py build
