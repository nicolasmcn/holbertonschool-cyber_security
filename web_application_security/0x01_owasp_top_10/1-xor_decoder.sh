#!/bin/bash

encoded_hash=$(echo "$1" | sed 's/{xor}//')

decoded_base64=$(echo "$encoded_hash" | base64 --decode)

XOR_KEY=0x5A

decoded=""

for (( i=0; i<${#decoded_base64}; i++ )); do
    char="${decoded_base64:$i:1}"

    dec=$(printf '%d' "'$char")

    decoded_char=$(printf \\x$(printf %x $((dec ^ XOR_KEY))))

    decoded+="$decoded_char"
done

echo "$decoded"

