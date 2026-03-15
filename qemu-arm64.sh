#!/bin/sh -e
#
# OpenBSD 7.8 (arm64) on Qemu/KVM.
#

# Install disk
test -f openbsd78-qemu-arm64.img || \
    qemu-img create -f raw openbsd78-qemu-arm64.img 4G

curl -LO https://cdn.openbsd.org/pub/OpenBSD/signify/openbsd-78-base.pub
curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/SHA256.sig
curl -LO https://cdn.openbsd.org/pub/OpenBSD/7.8/arm64/miniroot78.img
signify -C -p openbsd-78-base.pub -x SHA256.sig miniroot78.img

# Boot miniroot78.img & install OpenBSD on raw disk.
qemu-system-aarch64 \
    -M virt -m 4096 \
    -cpu cortex-a57 -smp 4 \
    -nographic -serial mon:stdio \
    -bios edk2-aarch64-code.fd \
    -drive if=none,id=stick,format=raw,file=miniroot78.img \
    -device qemu-xhci,id=xhci \
    -device usb-storage,bus=xhci.0,drive=stick,removable=on \
    -drive file=openbsd78-qemu-arm64.img,format=raw,if=virtio \
    -netdev user,id=mynet0,hostfwd=tcp:127.0.0.1:7922-:22 \
    -device virtio-net,netdev=mynet0 
