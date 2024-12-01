#!/bin/bash


cd $HOME

sudo apt install libsystemd-dev

git clone https://github.com/baidu/dperf
cd dperf
make -j$(nproc)
