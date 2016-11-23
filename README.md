[![Build Status](https://travis-ci.org/aleksandra-tarkowska/omedev.svg?branch=master)](https://travis-ci.org/aleksandra-tarkowska/omedev)


HOW TO:
=======

Install Docker for Mac. Docker-Toolbox is not supported.

Clone me:

    git clone git://github.com/aleksandra-tarkowska/dev omedev
    cd omedev

or

    git clone -b develop git://github.com/aleksandra-tarkowska/dev develop
    cd develop


or

    git clone -b metadata52 git://github.com/aleksandra-tarkowska/dev metadata52
    cd metadata52

if your project name is different you have to manually change name of basic image in docker/omero/Dockerfile

    FROM PROJECTNAME_omerobuild:latest


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

        ./bf up --build|rm -fv

- OMERO:

        ./build --build|rm -fv

Run:
----

Review .env file


To run OMERO.server and OMERO.web

- OMERO:

        ./omero up --build -d|logs -f|stop|rm -fv


To run just single component:

- SERVER:

        ./server up --build -d|logs -f|stop|rm -fv

- WEB:

        ./web up --build -d|logs -f|stop|rm -fv

interactive console

        ./web run --rm --service-ports omeroweb
