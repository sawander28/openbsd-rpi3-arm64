#!/bin/sh -e
# Get OpenBSD arm64 miniroot78 & RPi3 UEFI Firmware
rm -f SHA256.sig openbsd-78-base.pub miniroot78.img RPi3_UEFI_Firmware_v1.50.zip

curl -LO https://cdn.openbsd.org/pub/OpenBSD/snapshots/arm64/SHA256.sig
curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
curl -LO https://cdn.openbsd.org/pub/OpenBSD/snapshots/arm64/miniroot78.img
curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip

signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img
