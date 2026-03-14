#!/bin/sh

#
# Deploy files to miniroot78.img
#

if [ "$(id -u)" -ne 0 ]; then
    printf "This script must be run as root."
    exit 1
fi

# Mount raw image
mdconfig -t vnode -f miniroot78.img -u 0

# ufs rootfs partition
# Set framebuffer device or serial console
# stty 115200
# set tty com0
mount /dev/md0s4 /mnt
mkdir -p /mnt/etc
echo "set tty fb0" > /mnt/etc/boot.conf

umount /mnt


# UEFI Boot partition
# Backup efistub, remove bootloader, install rpi3 UEFI firmware & restore efistub.
mount -t msdos /dev/md0s1 /mnt
mv /mnt/efi /tmp
rm -rf /mnt/*
bsdunzip RPi3_UEFI_Firmware_v1.50.zip -d /mnt
mv /tmp/efi /mnt

umount /mnt

mdconfig -d -u0
