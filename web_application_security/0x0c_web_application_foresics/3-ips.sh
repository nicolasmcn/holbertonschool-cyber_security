#!/bin/bash
grep "Accepted" auth.log | awk '{print $1, $2, $3, $11}' | sort | uniq | wc -l
