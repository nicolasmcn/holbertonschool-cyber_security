#!/bin/bash
find "$1" -perm /2000 -printf "%P\n" 2>/dev/null
