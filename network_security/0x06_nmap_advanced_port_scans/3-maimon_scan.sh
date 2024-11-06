#!/bin/bash
sudo nmap -sM -v -p 21,22,23,80,443 -http -https -ssh --open --reason --packet-trace "$1"
