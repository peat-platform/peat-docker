# This file creates a Docker image containing the Attachment API

FROM ubuntu:14.04

MAINTAINER Aiden Keating <akeating@tssg.org>

RUN mkdir -p /opt/openi/cloudlet_platform/logs && \                                                                       
    apt-get update -y && \                                                                                           
    apt-get -y install git wget build-essential g++ uuid-dev binutils libtool autoconf automake libssl-dev apache2-utils python librrd-dev && \
    cd /tmp && \ 
    wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && \ 
    tar -zxvf zeromq-4.0.5.tar.gz && \        
    cd zeromq-4.0.5 && \ 
    ./configure && \ 
    make && \ 
    make install && \
    cd /tmp && \ 
    wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && \ 
    tar -zxvf node-v0.10.35.tar.gz && \ 
    cd /tmp/node-v0.10.35 && \ 
    ./configure && \ 
    make && \ 
    make install && \                                      
    npm -g install npm@latest && \ 
    rm -rf /tmp/* && \
    ldconfig

RUN apt-get -y clean autoclean && \
    apt-get -y autoremove


