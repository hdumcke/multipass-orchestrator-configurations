#!/bin/bash

# http://wiki.opalvoip.org/index.php?n=Main.BuildingPTLibMacOSX

git clone https://github.com/willamowius/ptlib.git

cd ptlib
export PTLIBDIR=$(pwd)
export DYLD_LIBRARY_PATH=${PTLIBDIR}/lib_Darwin_`uname -p`

./configure
make


cd samples/httptest
make
./obj_linux_x86_64/http

cd samples/url/
make
./obj_Darwin_x86_64/url http://192.168.64.112

# Lunx client
./obj_linux_x86_64/url http://192.168.64.1
