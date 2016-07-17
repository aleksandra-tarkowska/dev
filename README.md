HOW TO:
=======

    docker-compose -f docker-compose-m52.yml build|up -d|stop|rm


Limitations:
------------

PG permission denied error on mac

    docker run --name mypostgres -p 5432:5432 -d -v ./pgdata:/var/lib/postgresql/data postgres

create omero user

    createuser  -h pg95 -U postgres omero --interactive
