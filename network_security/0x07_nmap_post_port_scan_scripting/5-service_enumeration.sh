#!/bin/bash
nmap --script=default,ssl-enum-ciphers -p 80,443 $1 -oN service_enumeration_results.tx
