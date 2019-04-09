#!/bin/bash

set -x
touch /etc/multipath.conf
mkdir -p /etc/multipath
apt-get -f install
apt-get install -y open-iscsi multipath-tools
