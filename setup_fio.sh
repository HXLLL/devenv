#!/bin/bash

WORKSPACE="${HOME}"

cd ${WORKSPACE}
git clone https://github.com/axboe/fio
cd fio
./configure
make -j$(nproc)
sudo make install