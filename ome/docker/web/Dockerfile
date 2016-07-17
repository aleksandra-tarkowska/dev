FROM openmicroscopy/omero-ssh-daemon-c7:0.1.1
MAINTAINER A.Tarkowska@dundee.ac.uk

# OMERO.py prerequesties
RUN yum install -y epel-release \
    && yum clean all

RUN yum install -y gcc-c++ \
    zlib-devel \
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
    python-pip python-devel python-virtualenv \
    numpy scipy \
    # python-pillow \
    python-matplotlib python-tables \
    && yum clean all

# Install IcePy3.5
RUN curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
    http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

RUN yum install -y ice ice-python \
    # ice-servers \
    && yum clean all

# Install IcePy 3.6
#RUN yum -y install gcc-c++
#RUN yum -y install openssl-devel bzip2-devel expat-devel

RUN yum install -y python-redis && yum clean all

EXPOSE 4080

ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod a+x /tmp/run.sh


# AS OMERO user
USER omero
ENV HOME /home/omero
WORKDIR /home/omero

RUN virtualenv /home/omero/omeroweb-venv

# install Pillow
RUN source /home/omero/omeroweb-venv/bin/activate; pip install "Pillow<2.9"

# Install IcePy 3.6
# RUN source /home/omero/omeroweb-venv/bin/activate; pip install "zeroc-ice>3.5,<3.7"

CMD ["/tmp/run.sh"]
