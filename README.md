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

Build:
------

- BF:

        source metadata52/build.env
        source omerodev/build.env

        ./bf build|up|up -d|stop|rm

- OMERO:

        source metadata52/build.env
        source omerodev/build.env

        ./omerobuild build|up|up -d|stop|rm

Run OMERO:
----------

    ./omerodeploy build|up|up -d|stop|rm


Limitations:
------------

PG permission denied error on mac

    docker run --name mypostgres -p 5432:5432 -d -v ./pgdata:/var/lib/postgresql/data postgres

create omero user

    createuser  -h pg95 -U postgres omero --interactive
