#!/usr/bin/env bash

# build omero

set -eux

PATHDIR=`dirname $0`

if [ -n "${BUILD_NAME}" ]; then
    echo "BUILD_NAME is set to: ${BUILD_NAME}"
    docker-compose -f docker-compose-maven.yml "$@"
else 
    echo "source BUILD_NAME/build.env"
fi
    