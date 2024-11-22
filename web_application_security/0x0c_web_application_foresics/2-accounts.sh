#!/bin/bash
tail -n 1000 auth.log | awk '/Failed password for/{fail[$NF]++} /Accepted password for/{if(fail[$NF] > 0) print $NF}' | sort | uniq
