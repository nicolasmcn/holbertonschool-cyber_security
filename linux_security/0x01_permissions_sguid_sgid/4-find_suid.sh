#!/bin/bash
find "$1" -perm /4000 -printf "%P\n" 2>/dev/null
