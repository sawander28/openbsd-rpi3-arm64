#!/usr/bin/env make

install:
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/SHA256.sig
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/miniroot78.img
	curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip
	signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img

clean:
	[ -f openbsd-78-base.pub ] && rm -f openbsd-78-base.pub
	[ -f SHA256.sig ] && rm -f SHA256.sig
	[ -f miniroot78.img ] && rm -f miniroot78.img
	[ -f RPi3_UEFI_Firmware_v1.50.zip ] && rm -f RPi3_UEFI_Firmware_v1.50.zip
	[ -f site.tgz ] && rm -f site.tgz
	[ -f openbsd78-qemu-arm64.img ]] && rm -f openbsd78-qemu-arm64.img
