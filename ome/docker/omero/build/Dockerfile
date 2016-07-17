FROM centos:centos7
MAINTAINER A.Tarkowska@dundee.ac.uk


RUN yum install -y sudo \
    && yum clean all

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers


# OMERO.py prerequesties
RUN yum install -y epel-release \
    && yum clean all

RUN yum install -y unzip \
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

# Add OMERO user
RUN useradd omero && \
	echo 'omero:omero' | chpasswd omero &&\
	echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero

# SYMBOLIK LINKS
ADD ./symlinks/add_symlinks.sh /tmp/add_symlinks.sh
RUN chown omero:omero /tmp/add_symlinks.sh
RUN chmod +x /tmp/add_symlinks.sh

ADD ./symlinks/remove_symlinks.sh /tmp/remove_symlinks.sh
RUN chown omero:omero /tmp/remove_symlinks.sh
RUN chmod +x /tmp/remove_symlinks.sh

ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod a+x /tmp/run.sh

VOLUME /home/omero

# AS OMERO user
USER omero
ENV HOME /home/omero
WORKDIR /home/omero

# BUILD
# ONBUILD RUN /tmp/run.sh

CMD ["/tmp/run.sh"]