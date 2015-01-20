# This file creates a Docker image containing the Cloudlet API

FROM ubuntu:14.04 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Add user to the system
RUN sudo useradd -d /home/openi -m -p pass openi
RUN mkdir -p /opt/openi/cloudlet_platform/logs

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get -y install git npm wget librrd-dev

# Expose required ports
EXPOSE 49901 49902 49999

# Install ZeroMQ
RUN sudo apt-get install -y g++ uuid-dev binutils libtool autoconf automake
RUN cd /tmp && wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && tar -zxvf zeromq-4.0.5.tar.gz
RUN cd /tmp/zeromq-4.0.5 && ./configure && sudo make && sudo make install

# Install SQLite3
RUN sudo apt-get install -y sqlite3 libsqlite3-dev

# Install NodeJS Dependencies
RUN sudo apt-get install -y libssl-dev apache2-utils python 

# Install NodeJS
RUN cd /tmp && wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && tar -zxvf node-v0.10.35.tar.gz
RUN cd /tmp/node-v0.10.35 && ./configure && sudo make && sudo make install 

# Update NPM
RUN npm -g install npm@latest

# Install Cloudlet-api Dependencies
RUN sudo apt-get -y install jscoverage phantomjs

# Install Cloudlet API
RUN cd /home/openi && git clone https://github.com/OPENi-ict/cloudlet-api.git
RUN cd /home/openi/cloudlet-api && npm install


