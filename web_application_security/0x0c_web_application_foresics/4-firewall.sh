#!/bin/bash
sudo iptables -L -n --line-numbers | wc -l
