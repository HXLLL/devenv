#!/bin/bash

WORKSPACE="${HOME}"
VERSION_FIO="fio-3.38"

cd ${WORKSPACE}
git clone https://github.com/axboe/fio
cd fio
git checkout ${VERSION_FIO}
./configure
make -j$(nproc)
sudo make install