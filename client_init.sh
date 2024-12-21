#!/bin/bash

cd ~/devenv && ./smt.sh off
cd ~/blk-switch/scripts/
sudo ./system_setup.sh
sudo set_irq_affinity_cpulist.sh 0-15 ens1f0
sudo ./host_tcp_null.sh
# sudo ./host_i10_null.sh
