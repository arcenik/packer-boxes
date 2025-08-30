#!/bin/bash -eux

set -e pipefile
cd /root

# Install Ansible
apt-get -yqq update
apt-get -yqq upgrade
DEBIAN_FRONTEND=noninteractive apt-get -yqq -o Dpkg::Use-Pty=0 \
  install ansible
