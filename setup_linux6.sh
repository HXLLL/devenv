#!/bin/bash

sudo apt install -y dwarves libncurses-dev libelf-dev flex bison

cp dotfiles/.config $HOME/kernel_config
cd $HOME

git clone https://github.com/HXLLL/kernel-patched linux6

cd kernel_patched
git checkout linux6-hxl
mv $HOME/kernel_config .config

make bzImage -j$(nproc)
make modules -j$(nproc)
sudo make modules_install
sudo make install
