# This file creates and runs a Docker container
# containing the permissions-api program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49909 49910 49999

# Install Permissions-api
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/permissions_api.git && \
    cd permissions_api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

