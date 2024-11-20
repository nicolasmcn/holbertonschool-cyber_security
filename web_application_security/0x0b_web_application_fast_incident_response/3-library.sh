#!/bin/bash
awk -F\" '{print $6}' "logs.txt" | sort | uniq -c | sort -rn | head -n 1 | awk '{$1=""; print $0}' | sed 's/^ //'
