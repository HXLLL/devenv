#!/bin/bash

sed -i -e 's/\(GRUB_CMDLINE_LINUX=".*\)"/\1 nosmt"/' -e 'p' /etc/default/grub
update-grub
