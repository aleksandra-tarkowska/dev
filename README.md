HOW TO:
=======

Clone repository:
-----------------

- metadata:

        git clone -b metadata git://github.com/openmicroscopy/bioformats metadata52/src/bf.git
        git clone -b metadata52 git://github.com/openmicroscopy/openmicroscopy metadata52/src/omero.git

- develop:

        git clone git://github.com/openmicroscopy/bioformats omerodev/src/bf.git
        git clone git://github.com/openmicroscopy/openmicroscopy omerodev/src/omero.git


Prepare:
--------

    source metadata52/build.env
    source omerodev/build.env


Build:
------

- BF:

        ./bf build|up|rm

- OMERO:

        BUILD_CMD=build-dev ./omero build|up|rm

Run:
----

- SERVER:

        BUILD_CMD=build-dev ./server build|up -d|logs -f|stop|rm

- WEB:

        BUILD_CMD=build-dev ./web build|up -d|logs -f|stop|rm


Limitations:
------------

PG permission denied error on mac

    docker run --name mypostgres -p 5432:5432 -d -v ./pgdata:/var/lib/postgresql/data postgres

create omero user

    createuser  -h pg95 -U postgres omero --interactive
