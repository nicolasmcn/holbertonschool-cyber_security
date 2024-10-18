#!/bin/bash
sudo nmap --script ssl-enum-ciphers -Pn 443 $1
