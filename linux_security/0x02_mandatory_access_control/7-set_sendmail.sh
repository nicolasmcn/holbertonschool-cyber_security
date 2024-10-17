#!/bin/bash
sudo setsebool -P httpd_can_sendmail "$1" | sudo semanage boolean -l | grep "httpd_can_sendmail"
