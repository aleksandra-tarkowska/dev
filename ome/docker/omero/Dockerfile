FROM openmicroscopy/omero-ssh-daemon-c7:0.1.1
MAINTAINER A.Tarkowska@dundee.ac.uk

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

ENV JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk"

# Install Python and other dependences
RUN yum install -y \
    python-pip python-devel \
    numpy scipy \
    # python-pillow \
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

# Install maven
# RUN curl -o /etc/yum.repos.d/epel-apache-maven.repo \
#    https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo
# RUN yum -y install apache-maven \
#    && yum clean all
# RUN curl -o /tmp/apache-maven-3.3.9-bin.tar.gz http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
# RUN cd /usr/local && tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz
# RUN ln -s /usr/local/apache-maven-3.3.9 /usr/local/maven
# RUN rm /tmp/apache-maven-3.3.9-bin.tar.gz

# install sphinx
RUN pip install sphinx


# install Pillow
RUN pip install "Pillow<2.9"

# BUILD

ADD ./run.sh /tmp/run.sh
RUN chown omero:omero /tmp/run.sh
RUN chmod +x /tmp/run.sh


EXPOSE 4064
EXPOSE 4063

# AS OMERO user
USER omero
ENV HOME /home/omero
WORKDIR /home/omero

CMD ["/tmp/run.sh"]
