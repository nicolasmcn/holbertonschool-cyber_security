#!/bin/bash
sudo semanage port -a -t http_port_t -p tcp 81 |sudo semanage port -l | grep "http_port_t"
