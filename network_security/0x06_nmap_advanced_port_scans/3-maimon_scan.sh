#!/bin/bash
sudo nmap -sM -p 21-23,80,443 --open --reason --packet-trace "$1"
