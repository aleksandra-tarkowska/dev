#!/bin/bash

$DOCKER_BIN /bin/bash -c "
if [ -d $OMERO_PREFIX/lib/python/omeroweb ]; then
    rm -rf $OMERO_PREFIX/lib/python/omeroweb
    ln -s $OMERO_PREFIX/../components/tools/OmeroWeb/omeroweb/ $OMERO_PREFIX/lib/python/omeroweb
fi

if [ -d $OMERO_PREFIX/../components/tools/target/lib/python/omeroweb ]; then
    rm -rf $OMERO_PREFIX/../components/tools/target/lib/python/omeroweb
    ln -s $OMERO_PREFIX/../components/tools/OmeroWeb/omeroweb/ $OMERO_PREFIX/../components/tools/target/lib/python/omeroweb
fi

if [ -d $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/omeroweb ]; then
    rm -rf $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/omeroweb
    ln -s $OMERO_PREFIX/../components/tools/OmeroWeb/omeroweb/ $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/omeroweb
fi

rm -rf $OMERO_PREFIX/lib/python/omero/gateway
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/gateway/ $OMERO_PREFIX/lib/python/omero/gateway
rm -rf $OMERO_PREFIX/../components/tools/target/lib/python/omero/gateway
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/gateway/ $OMERO_PREFIX/../components/tools/target/lib/python/omero/gateway
rm -rf $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/gateway
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/gateway/ $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/gateway
rm -rf $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/gateway
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/gateway/ $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/gateway


rm -rf $OMERO_PREFIX/lib/python/omero/plugins
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/plugins/ $OMERO_PREFIX/lib/python/omero/plugins
rm -rf $OMERO_PREFIX/../components/tools/target/lib/python/omero/plugins
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/plugins/ $OMERO_PREFIX/../components/tools/target/lib/python/omero/plugins
rm -rf $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/plugins
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/plugins/ $OMERO_PREFIX/../components/tools/OmeroPy/target/omero/plugins
rm -rf $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/plugins
ln -s $OMERO_PREFIX/../components/tools/OmeroPy/src/omero/plugins/ $OMERO_PREFIX/../components/tools/OmeroPy/build/lib/omero/plugins
