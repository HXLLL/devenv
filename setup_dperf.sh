#!/bin/bash


cd $HOME

git clone https://github.com/baidu/dperf
make -j$(nproc)
