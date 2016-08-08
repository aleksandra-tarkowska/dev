#!/bin/bash

set -e

## workaround for Docker on Mac
## https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/
## Mounted volume slows down build

rm -rf /home/omero/omero
rm -rf /home/omero/dist

(cd /home/omero/omero.git && ./build.py clean)
cp -r /home/omero/omero.git /tmp/src

(cd /tmp/src && BUILD_NUMBER=1 ./build.py $BUILD_CMD)

mkdir -p /home/omero/dist
mv /tmp/src/dist /home/omero/omero.git/dist
mv /tmp/src/target /home/omero/omero.git/target

server_zip=$(ls /home/omero/omero.git/target/OMERO.server*.zip)
server_dist=/home/omero/dist/$(basename ${server_zip%.zip})
unzip $server_zip -d /home/omero/dist
mv $server_dist /home/omero/dist/OMERO.server

py_zip=$(ls /home/omero/omero.git/target/OMERO.py*.zip)
py_dist=/home/omero/dist/$(basename ${py_zip%.zip})
unzip $py_zip -d /home/omero/dist
mv $py_dist /home/omero/dist/OMERO.py
