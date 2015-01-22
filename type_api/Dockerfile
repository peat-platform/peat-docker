# This file creates a Docker image containing the Type API

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49905 49906 49999

# Install Type API
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/type-api.git && \
    cd type-api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /type-api/lib/
