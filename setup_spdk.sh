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

function install_spdk() {
	git clone https://github.com/spdk/spdk.git --recursive --depth=1
	cd spdk
	sudo ./scripts/pkgdep.sh --all

	./configure --with-rdma --with-shared
	make -j$(nproc)
	sudo make install
}

function configure_spdk() {
	sudo tee -a /etc/modprobe.d/spdk.conf <<-EOF
		* soft memlock unlimited
		* hard memlock unlimited
	EOF

	ulimit -l unlimited
	ulimit -Hl unlimited

	sudo scripts/setup.sh
}

WORKSPACE="${HOME}"

parse_args

cd ${WORKSPACE}

install_spdk
configure_spdk