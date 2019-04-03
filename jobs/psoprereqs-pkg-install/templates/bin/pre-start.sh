#!/bin/bash

set -x
echo "This is running now"
cd /var/vcap/packages/psoprereqs/apt/cache/
. install-packages.sh
