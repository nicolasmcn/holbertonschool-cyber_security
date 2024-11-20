#!/bin/bash
grep -oP '(?<=pam_unix\().*?(?=\))' "auth.log" | sort | uniq -c | sort -nr
