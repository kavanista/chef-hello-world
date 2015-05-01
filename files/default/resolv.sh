#!/bin/bash

set -e

cat <<EOF > /etc/resolvconf/resolv.conf.d/base
nameserver 172.16.0.23
search ec2.internal
EOF

resolvconf -u
