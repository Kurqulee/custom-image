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
dnf5 -y config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# install packages
# TODO: replace virt-manager system package with flatpak once USB drives can be passed through
# TODO: Look into making emacs a sysext once Fedora 42 lands
dnf5 -y install trivalent
dnf5 -y install trivalent-subresource-filter
dnf5 -y install mullvad-vpn
dnf5 -y install virt-manager
dnf5 -y install emacs

#### Example for enabling a System Unit File

# systemctl enable podman.socket
