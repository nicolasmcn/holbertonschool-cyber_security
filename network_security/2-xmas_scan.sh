#!/bin/bash
sudo nmap -sX -p 440-450 --open --reason "$1"
