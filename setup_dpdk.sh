#!/bin/bash


sudo apt install -y python3-pyelftools libnuma-dev

cd $HOME

wget https://fast.dpdk.org/rel/dpdk-24.07.tar.xz
tar xvf dpdk-24.07.tar.xz
cd dpdk-24.07

meson setup build
cd build
ninja
sudo meson install
sudo ldconfig 


