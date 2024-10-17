#!/bin/bash
sudo semanage login -a -s user_u "$1" | sudo semanage login -l | grep "$1"
