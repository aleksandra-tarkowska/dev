FROM maven:3.3.3-jdk-8
MAINTAINER A.Tarkowska@dundee.ac.uk

WORKDIR /usr/src/app/bf.git

ONBUILD RUN mvn install -DskipTests
