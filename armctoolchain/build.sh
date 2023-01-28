#!/bin/bash

sudo apt install -y make
wget -O  ~/arm-none-eabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=95edb5e17b9d43f28c74ce824f9c6f10&hash=176C4D884DBABB657ADC2AC886C8C095409547C4
# start in background because of timing
~/multipass-orchestrator-configurations/armctoolchain/compile.sh &
