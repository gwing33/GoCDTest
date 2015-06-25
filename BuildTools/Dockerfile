# This image contains docker
FROM jpetazzo/dind:latest

MAINTAINER  Gerald Leenerts <gleenerts@lifetimefitness.com>

ENV         ACTIVATOR_VERSION 1.3.5
ENV         DEBIAN_FRONTEND noninteractive

# INSTALL OS DEPENDENCIES
RUN         apt-get update && apt-get install -y \
            git \
            software-properties-common \
            unzip \
            curl \
            openssl \
            maven \
            wget

# INSTALL JAVA 8
RUN         echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
            echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
            add-apt-repository -y ppa:webupd8team/java && \
            apt-get update && \
            apt-get install -y oracle-java8-installer

# INSTALL TYPESAFE ACTIVATOR
RUN         cd /tmp && \
            wget http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip && \
            unzip typesafe-activator-$ACTIVATOR_VERSION.zip -d /usr/local && \
            mv /usr/local/activator-dist-$ACTIVATOR_VERSION /usr/local/activator && \
            rm typesafe-activator-$ACTIVATOR_VERSION.zip

# ADD         run_in_docker.sh /bin/bash/
ADD         run.sh /root/

# RUN         chmod +x /bin/bash/run_in_docker.sh
RUN         chmod +x /root/run.sh

WORKDIR     /root
ENTRYPOINT  ["/root/run"]
