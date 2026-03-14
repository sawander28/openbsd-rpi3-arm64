#!/bin/sh
sudo dd if=miniroot78.img of=/dev/da0 bs=1m
gpart show
