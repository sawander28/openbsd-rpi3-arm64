#!/usr/bin/env python3
import binascii
import datetime
import sys

from format_hex import add_colon_every_second_char

REFERENCE_TIME = datetime.datetime(2000, 1, 1, 0, 0, 0,
                                   tzinfo=datetime.timezone.utc)


def generate_duid_llt(mac_address, datetime_utc):
    duid_type = b'\x00\x01'
    hardware_type = b'\x00\x01'

    # The time value is the time that the DUID is generated represented
    # in seconds since midnight (UTC), January 1, 2000, modulo 2^32.
    # From: https://datatracker.ietf.org/doc/html/rfc3315#section-9.2
    duid_llt_time = (datetime_utc - REFERENCE_TIME).total_seconds()
    duid_llt_time = (int(duid_llt_time) % (2**32)).to_bytes(4, "big")

    mac_bytes = binascii.unhexlify(mac_address.replace(':', ''))

    duid_llt = duid_type + hardware_type + duid_llt_time + mac_bytes

    return duid_llt.hex()


if __name__ == "__main__":
    mac_address = "B8:27:EB:C9:AA:CA"
    utc_now = datetime.datetime.now(datetime.timezone.utc)
    duid_ll = generate_duid_llt(mac_address, utc_now)
    print(f"DUID-LLT: {add_colon_every_second_char(duid_ll)}")
