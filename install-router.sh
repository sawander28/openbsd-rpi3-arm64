#!/bin/sh
# Dump OpenBSD 7.8 arm64 to sd-card
gpart destroy -F da0
gpart create -s mbr da0
curl -LO https://cdn.openbsd.org/pub/OpenBSD/snapshots/arm64/miniroot78.img
dd if=miniroot78.img of=/dev/da0 bs=1m

# Install UEFI firmware on msdos partition
mount /dev/da0s4 /mnt
mkdir /mnt/etc
echo "set tty fb0" > /mnt/etc/boot.conf
umount /mnt
mount -t msdos /dev/da0s4 /mnt
mv /mnt/efi /tmp/
rm -rf /mnt/*
curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip
bsdunzip RPi3_UEFI_Firmware_v1.50.zip -d /mnt
mv /tmp/efi /mnt/
umount /mnt
