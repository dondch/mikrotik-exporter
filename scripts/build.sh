#!/bin/bash
set -e
set -x

DIR=`pwd`
NAME=`basename ${DIR}`
SHA=`git rev-parse --short HEAD`
VERSION=${VERSION:-$SHA}

GOOS=linux GOARCH=386 go build .

docker build -t nshttpd/${NAME}:${VERSION} .
docker push nshttpd/${NAME}:${VERSION}

rm mikrotik-exporter
