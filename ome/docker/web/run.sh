#!/bin/bash

rm -f /home/omero/OMERO.web/var/django.pid

if [ -L "/home/omero/OMERO.web" ]; then
    source /home/omero/omeroweb-venv/bin/activate
    pip install --upgrade -r /home/omero/OMERO.web/share/web/requirements-py27-nginx.txt
    /home/omero/OMERO.web/bin/omero web start --foreground
fi
