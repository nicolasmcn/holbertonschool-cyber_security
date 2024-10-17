#!/bin/bash
sudo setsebool -P httpd_can_sendmail on | sudo semanage boolean -l | grep "httpd_can_sendmail"
