#!/bin/bash

cd $HOME

. /etc/os-release

if [[ $VERSION_ID == "20.04" ]]; then
    wget https://www.mellanox.com/downloads/DOCA/DOCA_v2.9.0/host/doca-host_2.9.0-129000-24.10-ubuntu2004_amd64.deb
    sudo dpkg -i doca-host_2.9.0-129000-24.10-ubuntu2004_amd64.deb
elif [[ $VERSION_ID == "24.04" ]]; then
    wget https://www.mellanox.com/downloads/DOCA/DOCA_v2.9.0/host/doca-host_2.9.0-129000-24.10-ubuntu2404_amd64.deb
    sudo dpkg -i doca-host_2.9.0-129000-24.10-ubuntu2404_amd64.deb
else
    echo "Unsupported OS version"
    exit 1
fi

sudo apt-get update
if [[ -n $1 ]]; then
    sudo apt-get -y install $1
fi
