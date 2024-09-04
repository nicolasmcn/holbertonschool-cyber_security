#!/bin/bash
echo "$1" | sed 's/{xor}//' | base64 --decode | tr '\0-\177' '\102-\177\0-\101'
