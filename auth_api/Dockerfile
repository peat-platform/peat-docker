# This file creates a Docker image containing the Auth API

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49913 49914 49999

# Install Auth API
RUN sudo apt-get -y install librrd-dev python && \
    sudo apt-get -y install librrd-dev python && git clone https://github.com/OPENi-ict/auth-api.git && \
    cd auth-api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

