#!/bin/bash

# Get the first argument passed to the script
password="$1"

# Remove the {xor} prefix from the string
password="${password#'{xor}'}"

# Decode the Base64 encoded string
decoded_password=$(echo -n "$password" | openssl enc -base64 -d)

# Initialize the variable to store the XOR operation result
output=""

# Loop through each character in the string
for ((i = 0; i < ${#decoded_password}; i++)); do
    # Get the character at the current position
    char="${decoded_password:$i:1}"
    # Convert the character to its ASCII code and perform XOR operation with 95
    xor_result=$(( $(printf "%d" "'$char") ^ 95 ))
    # Add the result to the output variable
    output+=$(printf "\\$(printf '%03o' $xor_result)")
done

# Display the result
echo "$output"
