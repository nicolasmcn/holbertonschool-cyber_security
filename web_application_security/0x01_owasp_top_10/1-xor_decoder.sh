#!/bin/bash
echo "$1" | sed 's/{xor}//' | base64 --decode | xxd -p -r | tr '\42-\177\0-\41' '\0-\177'
