#!/bin/bash

set -eux

## workaround for Docker on Mac
## https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/
## Mounted volume slows down build
rm -rf /home/omero/omero
rm -rf /home/omero/dist

(cd /home/omero/src/omero.git && ./build.py clean)
cp -r /home/omero/src/omero.git /tmp/src

(cd /tmp/src && BUILD_NUMBER=1 ./build.py $BUILD_CMD)

mkdir -p /home/omero/dist
mv /tmp/src/dist /home/omero/dist/OMERO.server
mv /tmp/src/target /home/omero/dist/target


# on linux use
# rm -rf /home/omero/dist
# BUILD_NUMBER=1 ./build.py build-dev release-all
# mv /home/omero/src/dist /home/omero/dist/OMERO.server