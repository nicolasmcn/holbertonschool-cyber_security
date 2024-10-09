#!/bin/bash
john --wordlist=rockyou.txt --format=Raw-MD5 "$1" && john --show --format=Raw-MD5 "$1" > 4-password.txt
