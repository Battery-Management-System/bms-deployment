#!/bin/bash
ARG=$1
VERSION=1.0.4
if [[ -z "${ARG}" ]]; then
	echo "Using default version ${VERSION} for deployment"
else
	VERSION=$ARG
fi
mkdir -p ./volume/mysql/data
mkdir -p ./volume/timescale/data
mkdir -p ./volume/uptime/data

URL=https://github.com/nguyencatpham/bms-deployment/archive/refs/tags/v$VERSION.tar.gz
BASE_DIR=/tmp/bms-deployment/bms-deployment-$VERSION

echo "URL: ${URL}"

mkdir -p /tmp/bms-deployment
curl -Ls $URL | tar xvz -C /tmp/bms-deployment/

cd $BASE_DIR && ./install.sh
