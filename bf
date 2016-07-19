#!/usr/bin/env bash

# build omero

set -eux

PATHDIR=`dirname $0`

docker-compose -f docker-compose-maven.yml "$@"