#!/bin/bash
#

IPOD_MAKEFILE="/usr/src/emulab-ipod-dkms-3.4.0/Makefile"

sed -i '/^obj-m.*/a EXTRA_CFLAGS += -Wno-error=incompatible-pointer-types' $IPOD_MAKEFILE
