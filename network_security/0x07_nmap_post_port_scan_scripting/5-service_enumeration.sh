#!/bin/bash
nmap -sV -sC -A -O --script "banner*,ssl-enum-ciphers*,default*,smb-enum-domains*" $1 -oN service_enumeration_results.tx
