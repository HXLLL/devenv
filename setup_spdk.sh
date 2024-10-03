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
	git clone https://github.com/spdk/spdk.git --recursive --depth=1
	cd spdk
	# sudo -E -H ./scripts/pkgdep.sh --all

    activate="/var/spdk/dependencies/pip/bin/activate"

	./configure --with-rdma --with-shared
	. $activate && make -j$(nproc)
	sudo -E -H bash -c ". $activate && make install"
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
