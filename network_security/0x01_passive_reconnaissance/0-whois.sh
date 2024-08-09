#!/bin/bash
whois $1 | awk -F ' /Registrant|Admin|Tech|registrant|admin|tech/' > $1.csv
