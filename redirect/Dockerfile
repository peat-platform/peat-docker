# This file creates a Docker image containing the Swagger Def program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Install Redirect
ADD https-redirect /https-redirect/
    
RUN sudo apt-get -y install build-essential python && cd /https-redirect/ && npm install && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

WORKDIR /https-redirect/lib/

ENTRYPOINT ["node", "main.js"]
