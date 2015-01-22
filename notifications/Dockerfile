# This file creates a Docker image containing the Notifications program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49500 49505 49506 49998

# Install Notifications
RUN sudo apt-get -y install librrd-dev python && \
    git clone https://github.com/OPENi-ict/notifications.git && \
    cd notifications/ && npm install && \
    sudo apt-get purge -y librrd-dev python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

ADD docker-runner.js /notifications/lib/

