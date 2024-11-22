#!/bin/bash
grep "Accepted password for" auth.log | awk '{print $9}' | sort | uniq | paste -sd',' -
