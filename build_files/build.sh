#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# enable repos
dnf5 -y config-manager addrepo --overwrite --from-repofile=https://repo.secureblue.dev/secureblue.repo
dnf5 -y copr enable secureblue/trivalent

# install packages
dnf5 install -y \
	trivalent \
	trivalent-subresource-filter \
	webkit2gtk4.1

# disable repos
dnf5 -y copr disable secureblue/trivalent
dnf5 -y config-manager setopt secureblue.enabled=0

# Needed symlink for Lem's AppImage
mkdir -p /usr/lib/x86_64-linux-gnu
ln -s /usr/libexec/webkit2gtk-4.1 /usr/lib/x86_64-linux-gnu/

#### Example for enabling a System Unit File

# systemctl enable podman.socket
