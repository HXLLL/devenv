#!/bin/bash


sudo parted /dev/sda rm 99
sudo parted /dev/sda resizepart 3 400G
sudo sed -i -e '/swap/d' /etc/fstab
