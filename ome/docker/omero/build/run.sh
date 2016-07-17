#!/bin/bash

/tmp/remove_symlinks.sh \
    && BUILD_NUMBER=1 omero.git/build.py build-dev \
    && /tmp/add_symlinks.sh
