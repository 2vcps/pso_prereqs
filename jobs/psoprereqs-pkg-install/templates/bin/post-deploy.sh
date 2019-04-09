#!/bin/bash

set -x

apt-get -f install
apt-get install -y open-iscsi multipath-tools
