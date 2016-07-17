#!/bin/bash

if [ -L "/home/omero/OMERO.server" ]; then
    /home/omero/OMERO.server/bin/omero admin start --foreground
else
    sudo /usr/sbin/sshd -D
fi
