# This file creates a Docker image containing the Communications module

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49907 49908 49998

# Install Communications
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/communications.git && \
    cd communications/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y && \
    npm install html-to-text

ADD docker-runner.js /communications/lib/

WORKDIR /communications/lib/

ENTRYPOINT ["node", "docker-runner.js"]
