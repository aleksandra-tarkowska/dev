FROM omedev_omerobuild:latest
MAINTAINER A.Tarkowska@dundee.ac.uk

USER root

# STARTUP script
ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod a+x /tmp/run.sh

EXPOSE 4064
EXPOSE 4063

# AS OMERO user
USER omero
ENV HOME /home/omero
ENV OMERO_DIST /home/omero/OMERO.server
WORKDIR /home/omero

CMD ["/tmp/run.sh"]
