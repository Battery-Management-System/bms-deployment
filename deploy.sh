#!/bin/bash
ARG=$1
VERSION=1.3.0
if [[ -z "${ARG}" ]]; then
	echo "Using default version ${VERSION} for deployment"
else
	VERSION=$ARG
fi

BASE_DIR=$HOME/bms
mkdir -p $BASE_DIR/volume/mysql/data
mkdir -p $BASE_DIR/volume/timescale/data
mkdir -p $BASE_DIR/volume/uptime/data

URL=https://github.com/Battery-Management-System/bms-deployment/archive/refs/tags/v$VERSION.tar.gz

echo "URL: ${URL}"

curl -Ls $URL | tar xvz -C /tmp

mv /tmp/"bms-deployment-${VERSION}/*" $BASE_DIR

cd $BASE_DIR && ./install.sh
