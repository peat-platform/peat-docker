# This file creates a Docker image containing the Couchbase DB

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 11210 8091 8092 9091

# Some of those installed programs will not be needed
RUN apt-get update && apt-get install -y curl nodejs npm openssh-server supervisor librtmp0 python-httplib2 xdotool wget software-properties-common python-software-properties && \
    wget --quiet http://packages.couchbase.com/releases/3.0.0/couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb && \
    dpkg -i couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb

RUN wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add - && \ 
    sudo wget -O/etc/apt/sources.list.d/couchbase.list \
    http://packages.couchbase.com/ubuntu/couchbase-ubuntu1204.list && \
    sudo apt-get update && \
    sudo apt-get install -y libcouchbase2-libevent libcouchbase-dev

ADD bootstrap.sh /home/
ADD confsed.lin64.gz /usr/local/sbin/confsed.gz
ADD populate_views.sh /home/

RUN gzip -d /usr/local/sbin/confsed.gz
RUN chmod 755 /usr/local/sbin/confsed

ENTRYPOINT ["bash", "/home/bootstrap.sh"]

    






