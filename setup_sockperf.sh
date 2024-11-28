#!/bin/bash

WORKSPACE=$HOME

cd $WORKSPACE
sudo apt install -y perl make automake autoconf m4 libtool-bin g++
git clone -b 3.10 https://github.com/Mellanox/sockperf

cd sockperf
./autogen.sh
./configure 
make -j$(nproc)
sudo make install