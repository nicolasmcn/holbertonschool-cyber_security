#!/bin/bash
hashcat -m 0 -a 0 "$1" rockyou.txt --force && hashcat -m 0 "$1" --show | awk -F ':' '{print $2}' > 7-password.txt
