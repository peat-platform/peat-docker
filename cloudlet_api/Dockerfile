# This file creates a Docker image containing the Cloudlet API

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49901 49902 49999

# Install Cloudlet API
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/cloudlet-api.git && \
    cd cloudlet-api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y


