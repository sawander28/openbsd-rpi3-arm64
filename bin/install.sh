#!/bin/sh

if [ $ID != 0 ]; then echo "Must be run by root."; exit 1; fi

#
# Setup rpi5 arm64 miniroot78.img
#
cd /srv/nfs/openbsd-rpi3-arm64
#curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
#curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/SHA256.sig
#curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/miniroot78.img
#curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip
#curl -LO https://github.com/andyvand/RPi5-D0-UEFI-firmware/releases/download/1.1/RPI5-D0-UEFI-RELEASE.zip
#curl -LO https://github.com/worproject/rpi5-uefi/releases/download/v0.3/RPi5_UEFI_Release_v0.3.zip
#signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img

# Mount raw image
mdconfig -t vnode -f miniroot78.img -u 0

# Add files to rootfs partition
mount /dev/md0s4 /mnt
mkdir -p /mnt/etc
echo "set tty fb0" > /mnt/etc/boot.conf
tar -czphf site78.tgz rootfs install.site install.conf
cp site78.tgz /mnt/site78.tgz
cp install.conf /mnt/install.conf
umount /mnt

# UEFI Boot partition
# Backup efistub, remove bootloader, install rpi3 UEFI firmware & restore efistub.
mount -t msdos /dev/md0s1 /mnt
mv /mnt/efi /tmp
rm -rf /mnt/*
bsdunzip RPi3_UEFI_Firmware_v1.50.zip -d /mnt
mv /tmp/efi /mnt
umount /mnt

# Clear references
mdconfig -d -u0
