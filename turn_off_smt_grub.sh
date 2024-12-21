#!/bin/bash

sed -i -e 's/\(GRUB_CMDLINE_LINUX=".*\)"/\1 nosmt"/'  /etc/default/grub
update-grub
