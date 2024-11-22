#!/bin/bash
tail -n 1000 auth.log | awk '/Failed password for/ && $9 != "invalid" {fail[$9]++} /Accepted password for/ {if(fail[$9] > 0) print $9}' | sort | uniq
