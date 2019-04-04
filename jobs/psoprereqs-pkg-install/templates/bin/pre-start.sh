#!/bin/bash

set -x

cd /var/vcap/packages/psoprereqs/apt/cache/archives
. install-packages.sh
