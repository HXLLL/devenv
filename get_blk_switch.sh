#!/bin/bash


cd $HOME

rm -rf blk-switch
git clone https://github.com/resource-disaggregation/blk-switch.git
cd blk-switch

TARGET_IP="${1:-192.168.1.2}"
read IFACE IP_ADDR <<< $(ip -o a | grep 192.168.1 | awk -s '{sub(/\/.*/,"",$4); print $2, $4}')
NR_CORES=$(nproc)

sed -i \
    -e $(printf '/TARGET_IP/c\TARGET_IP="%s"'   ${TARGET_IP}) \
    -e $(printf '/TARGET_INF/c\TARGET_IN="%s"'  ${IFACE})  \
    -e $(printf '/NR_CORES/c\NC_CORES=%s'       ${NR_CORES}) \
    ./scripts/system_env.sh
