#!/bin/bash

function parse_args() {
	while [[ $# -gt 0 ]]; do
		key="$1"
		case $key in
			-w|--workspace)
				WORKSPACE="$2"
				shift; shift
				;;
			*)
				shift
				;;
		esac
	done
}

function prepare() {
    sudo apt update
}

function install_spdk() {
    cd ${WORKSPACE}
	git clone https://github.com/HXLLL/spdk.git --recursive
	cd spdk
    git checkout v24.09
	sudo -E -H ./scripts/pkgdep.sh

    sudo modprobe ublk_srv
	./configure --with-shared --with-ublk
	make -j$(nproc)
	sudo make install
}

function configure_spdk() {
    cd ${WORKSPACE}/spdk
	sudo tee -a /etc/security/limits.conf <<-EOF
		* soft memlock unlimited
		* hard memlock unlimited
	EOF

    sudo prlimit --pid=$$ --memlock=unlimited:unlimited

	sudo scripts/setup.sh
}

WORKSPACE="${HOME}"

parse_args

prepare

install_spdk
configure_spdk
