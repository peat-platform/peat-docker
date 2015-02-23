# This file creates a Docker image containing the Attachment API

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49913 49914 49999

# Install Attachment API
RUN sudo apt-get -y update && sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/attachment-api.git && \
    cd  attachment-api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /attachment-api/lib/

WORKDIR /attachment-api/lib/

ENTRYPOINT ["node", "docker-runner.js"]
