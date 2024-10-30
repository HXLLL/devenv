#!/bin/bash

WORKSPACE="${HOME}"

cd ${WORKSPACE}
git clone https://github.com/axboe/liburing
cd liburing
./configure --cc=gcc --cxx=g++
make -j$(nproc)
sudo make install
sudo ldconfig