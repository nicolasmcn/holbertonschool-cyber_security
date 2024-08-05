#!/bin/bash
whois $1 | awk ' /Registrant|Admin|Tech|registrant|admin|tech/' > "$1.csv"