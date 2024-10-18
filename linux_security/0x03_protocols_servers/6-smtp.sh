#!/bin/bash
sudo grep "^smtpd_tls_security_level" || echo "/etc/postfix/main.cf"
