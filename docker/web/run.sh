#!/bin/bash

# cleanup
rm -f $OMERO_PY/var/django.pid
rm -f $OMERO_PY/var/django_secret_key

set -e

servername="localhost"
port=80

echo "Installing OMERO.web dependencies..."
set +o nounset
source /home/omero/omeroweb-venv/bin/activate
set -o nounset

# PYTHONPATH
if [[ $WEB_APPLICATION_SERVER != 'wsgi-tcp' ]]; then
    export PYTHONPATH=$OMERODEV_PYTHONPATH:${PYTHONPATH-}
fi
echo "PYTHONPATH=$PYTHONPATH"

pip install --upgrade -r $OMERO_PY/share/web/requirements-py27-nginx.txt
pip install --upgrade -r $HOME/requirements.txt

echo "Loading OMERO.web config..."
$OMERO_PY/bin/omero load /home/omero/omeroweb.config

# NGNIX config
if [[ $WEB_APPLICATION_SERVER != 'wsgi-tcp' ]]; then
    # cache original value
    echo "Generating OMERO.web nginx config for $servername:$port ..."
    $OMERO_PY/bin/omero config set omero.web.application_server wsgi-tcp
else
    $OMERO_PY/bin/omero config set omero.web.application_server $WEB_APPLICATION_SERVER
fi

$OMERO_PY/bin/omero web config nginx --http $port --servername $servername > /tmp/omeroweb.nginx.conf
sudo cp /tmp/omeroweb.nginx.conf $HOME/conf.d/
echo "nginx config saved in $HOME/conf.d/"


echo "Starting up OMERO.web [$WEB_APPLICATION_SERVER]..."

if [[ $WEB_APPLICATION_SERVER == 'wsgi-tcp' ]]; then

    $OMERO_PY/bin/omero config set omero.web.application_server.host 0.0.0.0
    $OMERO_PY/bin/omero config set omero.web.application_server.port 4080
    $OMERO_PY/bin/omero config set -- omero.web.wsgi_args '--reload'
    sudo chmod 777 -R $HOME/static/
    $OMERO_PY/bin/omero web start --foreground

elif [[ $WEB_APPLICATION_SERVER == 'development' ]]; then

    $OMERO_PY/bin/omero config set omero.web.application_server 'development'
    $OMERO_PY/bin/omero config set omero.web.debug True

    touch $OMERO_PY/var/django.pid

    if [ -L $OMERO_PY/lib/python/omeroweb ]; then
        rm $OMERO_PY/lib/python/omeroweb
    elif [ -d $OMERO_PY/lib/python/omeroweb ]; then
        rm -rf $OMERO_PY/lib/python/omeroweb
    fi
    ln -s $OMEROWEB_SRC/omeroweb/ $OMERO_PY/lib/python/omeroweb

    /home/omero/omeroweb-venv/bin/python $OMEROWEB_SRC/omeroweb/manage.py runserver 0.0.0.0:4080

elif [[ $WEB_APPLICATION_SERVER == 'gunicorn' ]]; then

    $OMERO_PY/bin/omero config set omero.web.application_server 'development'
    $OMERO_PY/bin/omero config set omero.web.debug True

    if [ -L $OMERO_PY/lib/python/omeroweb ]; then
        rm $OMERO_PY/lib/python/omeroweb
    elif [ -d $OMERO_PY/lib/python/omeroweb ]; then
        rm -rf $OMERO_PY/lib/python/omeroweb
    fi
    ln -s $OMEROWEB_SRC/omeroweb/ $OMERO_PY/lib/python/omeroweb

    (cd $OMEROWEB_SRC/omeroweb \
        && gunicorn \
            -p $OMERO_PY/var/django.pid \
            --bind 0.0.0.0:4080 \
            --workers 5 \
            --timeout 60 \
            --max-requests 300 \
            --reload \
            --log-level=DEBUG \
            omeroweb.wsgi:application)

else
    echo "omero.web.application_server=$WEB_APPLICATION_SERVER is not supported"
fi

# cleanup django pid
rm -f $OMERO_PY/var/django.pid
rm -f $OMERO_PY/var/django_secret_key
