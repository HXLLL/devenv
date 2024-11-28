#!/bin/bash

VERSION_LIBURING="liburing-2.8"

WORKSPACE="${HOME}"

cd ${WORKSPACE}
git clone https://github.com/axboe/liburing
cd liburing
git checkout ${VERSION_LIBURING}
./configure --cc=gcc --cxx=g++
make -j$(nproc)
sudo make install
sudo ldconfig