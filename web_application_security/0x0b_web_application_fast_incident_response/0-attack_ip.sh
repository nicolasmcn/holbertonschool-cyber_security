#!/bin/bash
awk '{print $1}' $1 | sort | uniq -c | sort -nr | head -n 1
