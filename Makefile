#!/usr/bin/env make

install:
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/SHA256.sig
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/miniroot78.img
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/snapshots/arm64/miniroot79.img
	signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/install78.iso
	# UEFI firmware
	curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip
	curl -LO https://github.com/pftf/RPi4/releases/download/v1.50/RPi4_UEFI_Firmware_v1.50.zip
	curl -LO https://github.com/andyvand/RPi5-D0-UEFI-firmware/releases/download/1.1/RPI5-D0-UEFI-RELEASE.zip
	curl -LO https://github.com/worproject/rpi5-uefi/releases/download/v0.3/RPi5_UEFI_Release_v0.3.zip

clean:
	rm -f openbsd-78-base.pub SHA256.sig miniroot78.img miniroot79.img site78.tgz openbsd-78-qemu-arm64.img
	rm -f RPi3_UEFI_Firmware_v1.50.zip RPi5_UEFI_Release_v0.3.zip RPi4_UEFI_Firmware_v1.50.zip RPI5-D0-UEFI-RELEASE.zip 
