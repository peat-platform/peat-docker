# This file creates a Docker image containing the Attachment API

FROM ubuntu:14.04

MAINTAINER Aiden Keating <akeating@tssg.org>

# Add user to the system
RUN sudo useradd -d /home/openi -m -p pass openi && mkdir -p /opt/openi/cloudlet_platform/logs &&                       \
    sudo apt-get update -y && sudo apt-get -y install git wget librrd-dev &&                                            \
    sudo apt-get install -y g++ uuid-dev binutils libtool autoconf automake &&                                          \
    cd /tmp && sudo wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && sudo tar -zxvf zeromq-4.0.5.tar.gz &&        \
    cd zeromq-4.0.5 && sudo ./configure && sudo make && sudo make install &&                                            \
    sudo apt-get install -y libssl-dev apache2-utils python &&                                                          \
    cd /tmp && sudo wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && sudo tar -zxvf node-v0.10.35.tar.gz && \
    cd /tmp/node-v0.10.35 && sudo ./configure && sudo make && sudo make install &&                                      \
    npm -g install npm@latest && sudo rm -rf /tmp/* &&                                                                  \
    sudo apt-get purge -y g++ uuid-dev binutils libtool autoconf automake libssl-dev apache2-utils python &&            \
    sudo apt-get -y clean autoclean && sudo apt-get -y autoremove
