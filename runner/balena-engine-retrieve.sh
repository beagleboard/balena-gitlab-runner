#!/bin/bash

VERSION=$1
ARCH=$2

RELEASE_URL="https://github.com/balena-os/balena-engine/releases/download"

case $ARCH in
  amd64)
    ARCH="x86_64"
    echo "Arch switched to ${ARCH}"
    ;;
  armv7hf)
    ARCH="armv7hf"
    echo "Arch switched to ${ARCH}"
    ;;
  i386-nlp)
    ARCH="i386"
    echo "Arch switched to ${ARCH}"
    ;;
  rpi)
    ARCH="armv6"
    echo "Arch switched to ${ARCH}"
    ;;
  *)
    echo "Arch kept as ${ARCH}"
    ;;
esac

RELEASE_FILENAME="balena-engine-${VERSION}-${ARCH}.tar.gz"
wget --tries=3 --no-verbose "${RELEASE_URL}/${VERSION}/${RELEASE_FILENAME}"

mkdir -p balena-engine
cd balena-engine
tar xzvf "${RELEASE_FILENAME}"
cd ..
echo "Copying balena-engine to the path"
mv balena-engine/* /usr/bin
rm -rf balena-engine
