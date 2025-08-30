#!/bin/bash -eux

set -e pipefile
cd /root

# Uninstall Ansible and dependencies.
apt-get -yq remove ansible

# Apt cleanup.
apt autoremove -yq
apt update -q

#  Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
set +e
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY /tmp/* /tmp/.* /var/cache

# show disk usage
du -hx --max-depth=1 / | sort -h
du -hx --max-depth=1 /var | sort -h
set -e

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
