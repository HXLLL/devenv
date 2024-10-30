#!/bin/bash

WORKSPACE="${HOME}"

cd ${WORKSPACE}
git clone https://github.com/ublk-org/ublksrv
cd ublksrv

autoreconf
./configure 
make -j$(nproc)