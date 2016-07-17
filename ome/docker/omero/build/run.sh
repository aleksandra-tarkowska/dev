#!/bin/bash

set -eux

/tmp/remove_symlinks.sh \
    && BUILD_NUMBER=1 ./build.py build-dev \
    && /tmp/add_symlinks.sh
