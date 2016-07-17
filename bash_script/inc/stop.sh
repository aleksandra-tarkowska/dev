#!/bin/bash

$DOCKER_BIN /bin/bash -c "
if [ -d $OMERO_PREFIX ]; then 
    if [ -d $OMERO_PREFIX/bin/omero ]; then 
        $OMERO_PREFIX/bin/omero admin status --nodeonly && $OMERO_PREFIX/bin/omero admin stop
    fi;
fi;
"