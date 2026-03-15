#!/bin/sh -e
#
# Boot OpenBSD 7.8 (arm64) disk install on Qemu/KVM.
#

qemu-system-aarch64 \
    -M virt -m 4096 \
    -cpu cortex-a57 -smp 4 \
    -nographic -serial mon:stdio \
    -bios edk2-aarch64-code.fd \
    -drive file=openbsd78-qemu-arm64.img,format=raw,if=virtio \
    -netdev user,id=mynet0,hostfwd=tcp:127.0.0.1:7922-:22 \
    -device virtio-net,netdev=mynet0 
