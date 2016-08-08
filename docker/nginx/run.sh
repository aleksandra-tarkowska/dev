#!/bin/bash

set -e

until [ -f /home/omero/OMERO.py/var/django.pid ]; do
  >&2 echo "OMERO.web is unavailable - sleeping"
  sleep 10
done

>&2 echo "OMERO.web now accepts connections, starting nginx"
exec nginx -g "daemon off;"
