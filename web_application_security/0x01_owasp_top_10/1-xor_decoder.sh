#!/bin/bash
echo "$1" | sed 's/{xor}//' | base64 --decode
