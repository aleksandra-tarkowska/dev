#!/bin/bash

/tmp/remove_symlinks.sh \
    && omero.git/build.py build-dev \
    && /tmp/add_symlinks.sh
