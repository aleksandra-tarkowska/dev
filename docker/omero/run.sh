#!/bin/bash

set -eux

until psql -h $OMERO_DB_HOST -p $OMERO_DB_PORT -U $OMERO_DB_USER -c '\l'; do
  >&2 echo "$OMERO_DB_HOST is unavailable - sleeping"
  sleep 5
done

>&2 echo "$OMERO_DB_HOST now accepts connections, creating database $OMERO_DB_NAME..."

echo "Loading config..."
$OMERO_DIST/bin/omero load /home/omero/omero.config

$OMERO_DIST/bin/omero config set omero.db.host $OMERO_DB_HOST
$OMERO_DIST/bin/omero config set omero.db.port $OMERO_DB_PORT
$OMERO_DIST/bin/omero config set omero.db.user $OMERO_DB_USER
$OMERO_DIST/bin/omero config set omero.db.name $OMERO_DB_NAME
$OMERO_DIST/bin/omero config set omero.data.dir /home/omero/data


# initialize or upgarde the db
if psql -h $OMERO_DB_HOST -p $OMERO_DB_PORT -U $OMERO_DB_USER -lqt | cut -d \| -f 1 | grep -qw $OMERO_DB_NAME; then
    echo "WARNING: $OMERO_DB_NAME exists."
else
    createdb -h $OMERO_DB_HOST -p $OMERO_DB_PORT -U $OMERO_DB_USER $OMERO_DB_NAME
    echo "INFO: $OMERO_DB_NAME was created."
fi
omego db upgrade --serverdir $OMERO_DIST --dbname $OMERO_DB_NAME || omego db init --serverdir $OMERO_DIST --dbname $OMERO_DB_NAME

#createdb -h $OMERO_DB_HOST -p $OMERO_DB_PORT -U $OMERO_DB_USER $OMERO_DB_NAME || echo "DB $OMERO_DB_NAME already exist"
#$OMERO_DIST/bin/omero db script --file /tmp/dbsetup.sql --password "$OMERO_ROOT_PASS"
#psql -h $OMERO_DB_HOST -p $OMERO_DB_PORT -U $OMERO_DB_USER -d $OMERO_DB_NAME -f /tmp/dbsetup.sql || echo "DB $OMERO_DB_NAME already initialized"

echo "Starting OMERO.server..."
$OMERO_DIST/bin/omero admin start --foreground
