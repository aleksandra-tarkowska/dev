#!/bin/bash

set -eux

cp -r /home/omero/OMERO.server /tmp/OMERO.server

/tmp/OMERO.server/bin/omero load /home/omero/omero.config

/tmp/OMERO.server/bin/omero admin start --foreground
