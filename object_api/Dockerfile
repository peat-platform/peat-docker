# This file creates a docker image containing the openi object_api

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49903 49999

# Install Object API
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/object-api.git && \
    cd object-api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y && \
    sudo apt-get -y install rrdtool

ADD docker-runner.js /object-api/lib/

WORKDIR /object-api/lib/

ENTRYPOINT ["node", "docker-runner.js"]
