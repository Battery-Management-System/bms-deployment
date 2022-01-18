#!/bin/bash
VERSION=0.2.2
URL=https://github.com/nguyencatpham/bms-deployment/archive/refs/tags/v$VERSION.tar.gz
BASE_DIR=/tmp/bms-deployment/bms-deployment-$VERSION

echo "URL: ${URL}"

mkdir -p /tmp/bms-deployment
curl -Ls $URL | tar xvz -C /tmp/bms-deployment/

cd $BASE_DIR && ./install.sh