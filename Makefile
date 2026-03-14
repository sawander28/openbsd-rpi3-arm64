#!/usr/bin/env make

install:
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/SHA256.sig
	curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/miniroot78.img
	curl -LO https://github.com/pftf/RPi3/releases/download/v1.50/RPi3_UEFI_Firmware_v1.50.zip
	signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img

clean:
	sudo rm SHA256.sig
	sudo rm openbsd-78-base.pub
	sudo rm miniroot78.img
	sudo rm RPi3_UEFI_Firmware_v1.50.zip
