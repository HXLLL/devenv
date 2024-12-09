#!/bin/bash

cd $HOME
sudo apt install -y dwarves libncurses-dev libelf-dev flex bison
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.43.tar.gz
tar xzvf linux-5.4.43.tar.gz

git clone https://github.com/resource-disaggregation/blk-switch.git
cd blk-switch
cp -rf block drivers include ~/linux-5.4.43/

cd ~/linux-5.4.43/
cp /boot/config-$(uname -r) .config
make olddefconfig

sed -i -e '/^CONFIG_LOCALVERSION=/c\CONFIG_LOCALVERSION="-hxl"' \
       -e '/I10_HOST/c\CONFIG_I10_HOST=m' \
       -e '/I10_TARGET/c\CONFIG_I10_TARGET=m' \
       -e '/CONFIG_SYSTEM_TRUSTED_KEYS=/c\CONFIG_SYSTEM_TRUSTED_KEYS=""' .config

#
# build
#
make -j$(nproc) bzImage
make -j$(nproc) modules

echo "TODO: manually update the default boot entry in /etc/default/grub"
# sudo make modules_install -j$(nproc)
# sudo make install

echo "TODO: manually update the default boot entry in /etc/default/grub"
