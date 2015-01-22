# This file creates a Docker image containing the Swagger Def program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49908 49907

# Install Swagger Def
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/swagger-def.git && \
    cd swagger-def/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /swagger-def/lib/

