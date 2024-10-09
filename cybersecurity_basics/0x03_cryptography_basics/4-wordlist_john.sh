#!/bin/bash
john --wordlist=/home/nicolas/Downloads/rockyou.txt --format=Raw-MD5 "$1" && john --show "$1" > 4-password.txt
