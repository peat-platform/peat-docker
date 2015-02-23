# This file creates a Docker image containing Mongrel2

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 80 443

# Add mongrel2
RUN sudo apt-get -y update && apt-get install -y libsqlite3-dev sqlite3 openssh-server build-essential uuid-dev supervisor && \  
    wget https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/mongrel2-v1.9.1.tar.gz && \
    tar -zxvf mongrel2-v1.9.1.tar.gz && cd  mongrel2-v1.9.1 && make install && \
    cd / && git clone https://github.com/OPENi-ict/mongrel2.git

ADD cloudlet_platform.conf /mongrel2/
ADD start_mongrel2.sh /mongrel2/

WORKDIR /mongrel2/

ENTRYPOINT ["sh", "start_mongrel2.sh"]
