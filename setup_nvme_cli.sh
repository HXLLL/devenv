#!/bin/bash

VERSION_LIBNVME="v1.11.1"
VERSION_NVME_CLI="v2.11"

function setup_libnvme {
    cd $WORKSPACE
    git clone https://github.com/linux-nvme/libnvme
    cd libnvme
    git checkout $VERSION_LIBNVME
    rm -rf .build
    meson setup .build
    meson compile -C .build
    meson install -C .build
    sudo ldconfig
}

function setup_nvme_cli {
    cd $WORKSPACE
    git clone https://github.com/linux-nvme/nvme-cli
    cd nvme-cli
    git checkout $VERSION_NVME_CLI
    rm -rf .build
    meson setup .build
    meson compile -C .build
    meson install -C .build
}

WORKSPACE="${HOME}"

setup_libnvme
setup_nvme_cli
