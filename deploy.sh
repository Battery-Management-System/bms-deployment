#!/bin/bash
ARG=$1
VERSION=1.2.0
if [[ -z "${ARG}" ]]; then
	echo "Using default version ${VERSION} for deployment"
else
	VERSION=$ARG
fi

HOME=$HOME/bms
mkdir -p $HOME/volume/mysql/data
mkdir -p $HOME/volume/timescale/data
mkdir -p $HOME/volume/uptime/data
mkdir -p $HOME/bms-deployment

URL=https://github.com/Battery-Management-System/bms-deployment/archive/refs/tags/v$VERSION.tar.gz
BASE_DIR=$HOME/bms-deployment

echo "URL: ${URL}"

curl -Ls $URL | tar xvz -C $BASE_DIR

mv $BASE_DIR/"${BASE_DIR}-${VERSION}" $BASE_DIR

cd $BASE_DIR && ./install.sh
