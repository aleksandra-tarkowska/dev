#!/bin/bash

rm -f /home/omero/OMERO.server/var/django.pid

if [ -L "/home/omero/OMERO.server" ]; then
    source /home/omero/omero-virtualenv/bin/activate; /home/omero/OMERO.server/bin/omero web start --foreground
else
    sudo /usr/sbin/sshd -D
fi
