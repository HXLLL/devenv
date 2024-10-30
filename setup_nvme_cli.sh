#!/bin/bash

function setup_libnvme {
    cd $WORKSPACE
    git clone https://github.com/linux-nvme/libnvme
    cd libnvme
    meson setup .build
    meson compile -C .build
    meson install -C .build
}

function setup_nvme_cli {
    cd $WORKSPACE
    git clone https://github.com/linux-nvme/nvme-cli
    cd nvme-cli
    meson setup .build
    meson compile -C .build
    meson install -C .build
}

WORKSPACE="${HOME}"
