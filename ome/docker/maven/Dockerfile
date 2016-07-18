FROM maven:3.3.3-jdk-8
MAINTAINER A.Tarkowska@dundee.ac.uk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server sudo

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
  && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && touch /root/.Xauthority \
  && true

RUN useradd omero \
    && passwd -d omero \
    && mkdir /home/omero \
    && chown omero:omero /home/omero \
    && addgroup omero staff \
    && addgroup omero sudo \
    && true

EXPOSE 22


USER omero

WORKDIR /home/omero/bf.git

# ONBUILD RUN mvn install -DskipTests

CMD ["mvn"]
