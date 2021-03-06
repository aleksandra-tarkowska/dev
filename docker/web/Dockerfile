FROM openmicroscopy/omero-ssh-daemon-c7:0.1.1
MAINTAINER A.Tarkowska@dundee.ac.uk

# OMERO.py prerequesties
RUN yum install -y epel-release \
    && yum clean all

RUN yum install -y unzip git \
    && yum clean all

RUN yum install -y \
    zlib-devel \
    libjpeg-devel \
    libpng-devel \
    libtiff-devel \
    && yum clean all

# Install Python and other dependences
RUN yum install -y \
    python-pip python-virtualenv \
    numpy \
    python-pillow \
    && yum clean all

# Install IcePy3.5
#RUN curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
#    http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

#RUN yum install -y ice ice-python \
#    && yum clean all

# Install IcePy 3.6
RUN yum install -y gcc gcc-c++ \
    libdb-utils \
    openssl-devel bzip2-devel expat-devel \

RUN yum install -y python-redis && yum clean all

EXPOSE 4080

# Change user id to fix permissions issues
ARG USER_ID=1000
RUN usermod -u $USER_ID omero

# STARTUP
ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod a+x /tmp/run.sh

# AS OMERO user
USER omero
ENV HOME /home/omero
ENV OMERO_PY "/home/omero/OMERO.py"
ENV WEB_APPLICATION_SERVER "wsgi-tcp"
# Development env
ENV OMEROWEB_SRC "/home/omero/src/components/tools/OmeroWeb"
ENV OMERODEV_PYTHONPATH=/home/omero/OMERO.py/lib/python:/home/omero/OMERO.py/lib/fallback:/home/omero/OMERO.py/lib/scripts

WORKDIR /home/omero

RUN virtualenv /home/omero/omeroweb-venv --system-site-packages

# pip install
RUN source /home/omero/omeroweb-venv/bin/activate; pip install \
    "django-redis>4.4" \
    "zeroc-ice>3.5,<3.7"


CMD ["/tmp/run.sh"]
