# This file creates a Docker image containing the Type API

FROM ubuntu:14.04 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Add user to the system
RUN sudo useradd -d /home/openi -m -p pass openi
RUN mkdir -p /opt/openi/cloudlet_platform/logs

# Expose required ports
EXPOSE 49905
EXPOSE 49906
EXPOSE 49999

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get -y install git npm wget librrd-dev

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

# Install Type API
RUN cd /home/openi && git clone https://github.com/OPENi-ict/type-api.git
RUN cd /home/openi/type-api && npm install

