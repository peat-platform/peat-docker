# This file creates a Docker image containing the DAO

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49999 49902 49904 49906 49500 5984

# Install DAO
RUN sudo apt-get -y update && sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/dao.git && \
    cd dao/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /dao/lib/
#ADD CBasehelper.js /dao/lib/

WORKDIR /dao/lib/

ENTRYPOINT ["node", "docker-runner.js"]
