#! /bin/bash

qemu-img create -f $1 $2.$1 $3
sudo qemu-img convert -O $1 -S 0k $2.$1 /var/lib/libvirt/images/$2.$1
rm -f $2.$1