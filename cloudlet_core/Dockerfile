# This file creates a Docker image containing the Attachment API

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

# Add user to the system
RUN sudo useradd -d /home/openi -m -p pass openi
RUN mkdir -p /opt/openi/cloudlet_platform/logs

RUN sudo apt-get update -y && sudo apt-get -y install git wget librrd-dev

# Install ZeroMQ
RUN sudo apt-get install -y g++ uuid-dev binutils libtool autoconf automake 
RUN cd /tmp && sudo wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && sudo tar -zxvf zeromq-4.0.5.tar.gz &&
    cd zeromq-4.0.5 && sudo ./configure && sudo make && sudo make install 

# Install NodeJS Dependencies
RUN sudo apt-get install -y libssl-dev apache2-utils python

# Install NodeJS
RUN cd /tmp && wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && sudo tar -zxvf node-v0.10.35.tar.gz &&
    cd /tmp/node-v0.10.35 && sudo ./configure && sudo make && sudo make install

# Update NPM
RUN npm -g install npm@latest 

# Cleanup
RUN cd /tmp && rm -rf * &&
   sudo apt-get purge -y g++ uuid-dev binutils libtool autoconf automake libssl-dev apache2-utils python &&
   sudo apt-get clean autoclean


