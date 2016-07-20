FROM openmicroscopy/omero-ssh-daemon-c7:0.1.1
MAINTAINER A.Tarkowska@dundee.ac.uk

# OMERO.py prerequesties
RUN yum install -y epel-release \
    && yum clean all

RUN yum install -y unzip git \
    && yum clean all

RUN yum install -y zlib-devel \
    libjpeg-devel \
    libpng-devel \
    libtiff-devel \
    gcc \
    && yum clean all

# Install Java
RUN yum install -y java-1.8.0-openjdk-devel \
    && yum clean all

# Install Python and other dependences
RUN yum install -y \
    python-pip python-devel \
    numpy scipy \
    python-pillow \
    python-matplotlib python-tables \
    && yum clean all

# Install Ice 3.5
RUN curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
    http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

RUN yum install -y ice ice-python-devel ice-java-devel ice-servers \
    && yum clean all


# Install Postgres tools
RUN yum -y install http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
    && yum clean all
RUN yum -y install postgresql95 \
    && yum clean all

# install sphinx
RUN pip install sphinx

# install Pillow
RUN pip install "Pillow<2.9"

RUN pip install omego

VOLUME /home/omero

# Change user id to fix permissions issues
ARG USER_ID=1000
RUN usermod -u $USER_ID omero

# RUN sript
ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod a+x /tmp/run.sh

# AS OMERO user
USER omero
ENV HOME /home/omero
ENV BUILD_CMD "build-dev release-all"
WORKDIR /home/omero/omero.git

# BUILD
# ONBUILD RUN /tmp/run.sh

CMD ["/tmp/run.sh"]
