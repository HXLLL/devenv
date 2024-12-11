#!/bin/bash

cd ~/devenv && ./smt.sh off
cd ~/blk-switch/scripts/
sudo ./system_setup.sh
sudo set_irq_affinity_cpulist.sh 0-15 ens1f0
sudo ./target_null.sh

