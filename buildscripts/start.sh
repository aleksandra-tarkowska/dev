#!/bin/bash

$DOCKER_BIN /bin/bash -c "$OMERO_PREFIX/bin/omero admin start"

# load config
OMERO_CONF=`cat ${PATHDIR}/../${BUILD_NAME}/config.omero`
$DOCKER_BIN /bin/bash -c "$OMERO_PREFIX/bin/omero config load ${OMERO_CONF}"