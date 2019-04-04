#!/bin/bash

set -x
apt-get update
apt-get -f install -y
apt-get install -y multipath-tools open-iscsi

#cd /var/vcap/packages/psoprereqs/apt/cache/archives
#chmod +x install-packages.sh
#./install-packages.sh
