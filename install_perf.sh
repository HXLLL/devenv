#!/bin/bash

KERNEL_SRC=$1

if [[ -z $KERNEL_SRC ]]; then
    echo "$0 <kernel_src>"
    exit
fi

cd $KERNEL_SRC || { echo "cd to $KERNEL_SRC failed"; exit 1; }

sudo apt install -y libdw-dev libdwarf-dev libunwind-dev \
    libclang-dev llvm-dev libslang2-dev liblzma-dev numactl \
    libnuma-dev libcapstone-dev libbabeltrace-dev libpfm4-dev \
     systemtap-sdt-dev clang libperl-dev
sudo apt install -y libtracefs-dev libtraceevent-dev

cd tools/perf
make 
sudo make install DESTDIR=/usr/local

