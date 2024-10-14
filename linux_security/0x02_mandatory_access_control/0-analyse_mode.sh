#!/bin/bash
sestatus 2>/dev/null | grep "SELinux status:" | grep -q "enabled" && sestatus | grep "Current mode:" || echo "SELinux is disabled."
