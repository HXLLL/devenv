#!/bin/bash

cd $HOME

. /etc/os-release
if [[ $VERSION_ID != "20.04" ]]; then
    echo "This script only support ubuntu 20.04"
    exit 1
fi

wget https://www.mellanox.com/downloads/DOCA/DOCA_v2.9.0/host/doca-host_2.9.0-129000-24.10-ubuntu2004_amd64.deb
sudo dpkg -i doca-host_2.9.0-129000-24.10-ubuntu2004_amd64.deb
sudo apt-get update
sudo apt-get -y install doca-all