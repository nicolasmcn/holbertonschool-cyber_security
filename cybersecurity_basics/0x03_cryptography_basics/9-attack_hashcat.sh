#!/bin/bash
hashcat --stdout -a 1 wordlist1.txt wordlist2.txt > combined_wordlist.txt && hashcat -m 0 -a 0 "$1" combined_wordlist.txt --force && hashcat -m 0 "$1" --show | awk -F ':' '{print $2}' > 9-password.txt
