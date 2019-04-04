#!/bin/bash

set -x
echo "This is running now"
apt-get install -y open-iscsi
cd /var/vcap/packages/psoprereqs/apt/cache/
. install-packages.sh
