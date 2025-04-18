#!/bin/bash
# Taken from ublue-os/bazzite-dx
set -ouex pipefail

# Move directories from /var/opt to /usr/lib/opt
for dir in /var/opt/*/; do
	[ -d "$dir"  ] || continue
	dirname=$(basename "$dir")
	mv "$dir" "/usr/lib/opt/$dirname"
	echo "L+ /var/opt/$dirname - - - - /usr/lib/opt/$dirname" >>/usr/lib/tmpfiles.d/opt-fix.conf
done
