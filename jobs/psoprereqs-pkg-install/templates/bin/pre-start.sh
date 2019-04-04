#!/bin/bash

set -x

cd /var/vcap/packages/psoprereqs/apt/cache/archives
chmod +x install-packages.sh
./install-packages.sh
