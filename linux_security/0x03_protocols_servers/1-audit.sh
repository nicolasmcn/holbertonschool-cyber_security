#!/bin/bash
grep -Ev "^#" "/etc/ssh/sshd_config" | grep -Ev "^$" | xargs
