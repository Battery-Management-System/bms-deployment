#!/bin/bash
ARG=$1
VERSION=1.1.5
if [[ -z "${ARG}" ]]; then
	echo "Using default version ${VERSION} for deployment"
else
	VERSION=$ARG
fi
mkdir -p ./volume/mysql/data
mkdir -p ./volume/timescale/data
mkdir -p ./volume/uptime/data
mkdir -p ./bms-deployment

URL=https://github.com/nguyencatpham/bms-deployment/archive/refs/tags/v$VERSION.tar.gz
BASE_DIR=./bms-deployment

echo "URL: ${URL}"

curl -Ls $URL | tar xvz -C $BASE_DIR

cd $BASE_DIR && ./install.sh
