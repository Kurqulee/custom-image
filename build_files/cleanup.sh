#!/usr/bin/bash
set -euo pipefail

#clean cache
dnf5 clean all

# Yeet
rm -rf /tmp/*

# Cleanup /var
rm -rf /var
mkdir -p /var
