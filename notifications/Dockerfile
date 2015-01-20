# This file creates a Docker image containing the Notifications program

FROM ubuntu:14.04 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Add user to the system
RUN sudo useradd -d /home/openi -m -p pass openi
RUN mkdir -p /opt/openi/cloudlet_platform/logs

# Expose required ports
EXPOSE 49500 49505 49506 49998

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get -y install git npm wget

# Install ZeroMQ
RUN sudo apt-get install -y g++ uuid-dev binutils libtool autoconf automake
RUN cd /tmp && wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && tar -zxvf zeromq-4.0.5.tar.gz
RUN cd /tmp/zeromq-4.0.5 && ./configure && sudo make && sudo make install

# Install NodeJS Dependencies
RUN sudo apt-get install -y libssl-dev apache2-utils python 

# Install NodeJS
RUN cd /tmp && wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && tar -zxvf node-v0.10.35.tar.gz
RUN cd /tmp/node-v0.10.35 && ./configure && sudo make && sudo make install 

# Update NPM
RUN npm -g install npm@latest

# Install Cloudlet-api Dependencies
RUN sudo apt-get -y install jscoverage phantomjs

# Install Notifications
RUN cd /home/openi && git clone https://github.com/OPENi-ict/notifications.git
RUN cd /home/openi/notifications && npm install

