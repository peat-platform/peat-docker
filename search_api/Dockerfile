# This file creates a Docker image contining the Search API

FROM openiicteu/cloudlet_core
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49999 49911 49912

# Install Search API
RUN sudo apt-get -y update && sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/search_api.git && \
    cd search_api/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /search_api/lib/

WORKDIR /search_api/lib/

ENTRYPOINT ["node", "docker-runner.js"]
