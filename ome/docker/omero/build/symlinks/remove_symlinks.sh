#!/bin/bash

set -eux

if [ -L $OMERO_PREFIX/lib/python/omeroweb ]; then
  rm $OMERO_PREFIX/lib/python/omeroweb
fi

if [ -L $OMERO_PREFIX/lib/python/omero/gateway ]; then
  rm $OMERO_PREFIX/lib/python/omero/gateway
fi

if [ -L $OMERO_PREFIX/lib/python/omero/plugins ]; then
  rm $OMERO_PREFIX/lib/python/omero/plugins
fi

if [ -L $OMERO_PREFIX/../components/tools/target/lib/python/omeroweb ]; then
  rm $OMERO_PREFIX/../components/tools/target/lib/python/omeroweb
fi

if [ -L $OMERO_PREFIX/../components/tools/target/lib/python/omero/gateway ]; then
  rm $OMERO_PREFIX/../components/tools/target/lib/python/omero/gateway
fi

if [ -L $OMERO_PREFIX/../components/tools/target/lib/python/omero/plugins ]; then
  rm $OMERO_PREFIX/../components/tools/target/lib/python/omero/plugins
fi

if [ -L $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/omeroweb ]; then
  rm $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/omeroweb
fi

if [ -L $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/gateway ]; then
  rm $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/gateway
fi

if [ -L $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/plugins ]; then
  rm $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/plugins
fi

if [ -L $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/gateway ]; then
  rm $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/gateway
fi

if [ -L $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/plugins ]; then
  rm $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/plugins
fi
