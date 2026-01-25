#!/usr/bin/env python3
import binascii

from format_hex import add_colon_every_second_char


def generate_duid_ll(mac_address):
    duid_type = b'\x00\x03'
    hardware_type = b'\x00\x01'
    mac_bytes = binascii.unhexlify(mac_address.replace(':', ''))
    duid_ll = duid_type + hardware_type + mac_bytes
    return duid_ll.hex()


if __name__ == "__main__":
    mac_address = "b8:27:eb:c9:aa:ca"
    duid_ll = generate_duid_ll(mac_address)
    print(f"DUID-LL: {add_colon_every_second_char(duid_ll)}")
