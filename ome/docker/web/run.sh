#!/bin/bash

set -e

$servername="localhost"
$port=80

export PYTHONPATH=$OMERO_PY/lib/python:$OMERO_PY/lib/fallback:$OMERO_PY/lib/scripts:${PYTHONPATH-}

echo "Installing OMERO.web dependencies..."
set +o nounset
source /home/omero/omeroweb-venv/bin/activate
set -o nounset
pip install --upgrade -r $OMERO_PY/share/web/requirements-py27-nginx.txt


echo "Loading OMERO.web config..."
$OMERO_PY/bin/omero load /home/omero/omeroweb.config

echo "Generating OMERO.web nginx config for $servername:$port ..."
$OMERO_PY/bin/omero web config nginx --http $port --servername $servername > /tmp/omeroweb.nginx.conf
sudo cp /tmp/omeroweb.nginx.conf $HOME/conf.d/


# Instead of: $OMERO_PY/bin/omero web start --foreground
echo "Starting up OMERO.web config..."
sudo chmod 777 -R $HOME/static/
(cd $OMEROWEB_SRC/omeroweb \
    && python manage.py collectstatic --noinput \
    && gunicorn \
        -p $OMERO_PY/var/django.pid \
        --bind 0.0.0.0:4080 \
        --workers 5 \
        --timeout 60 \
        --max-requests 300 \
        --reload \
        omeroweb.wsgi:application)

# cleanup django pid
rm -f $OMERO_PY/var/django.pid
rm -f $OMERO_PY/var/django_secret_key