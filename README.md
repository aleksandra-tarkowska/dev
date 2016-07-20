HOW TO:
=======

Install Docker for Mac. Docker-Toolbox is not supported.

Clone me:

    git clone git://github.com/aleksandra-tarkowska/dev omerodev
    cd omerodev

or

    git clone git://github.com/aleksandra-tarkowska/dev metadata52
    cd metadata52


Clone repository:
-----------------

- develop:

        git clone git://github.com/openmicroscopy/bioformats src/bf.git
        git clone git://github.com/openmicroscopy/openmicroscopy src/omero.git

- metadata:

        git clone -b metadata git://github.com/openmicroscopy/bioformats src/bf.git
        git clone -b metadata52 git://github.com/openmicroscopy/openmicroscopy src/omero.git


Build:
------

- BF:

        ./bf build|up|rm

- OMERO:

        ./build build|up|rm

Run:
----

Review .env file

- SERVER:

        ./server build|up -d|logs -f|stop|rm

- WEB:

        ./web build|up -d|logs -f|stop|rm

