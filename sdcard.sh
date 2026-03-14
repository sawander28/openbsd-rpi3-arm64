#!/bin/sh

sudo  gpart destroy -F da0
sudo gpart create -s mbr da0
sudo dd if=miniroot78.img of=/dev/da0 bs=1m
gpart show
