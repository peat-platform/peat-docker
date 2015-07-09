# This file creates a Docker image containing the Couchbase DB

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 11210 8091 8092 9091

# Some of those installed programs will not be needed
RUN apt-get update && apt-get install -y curl nodejs npm openssh-server supervisor librtmp0 python2.7 python-httplib2 xdotool wget git software-properties-common python-software-properties && \
    wget --quiet http://latestbuilds.hq.couchbase.com/couchbase-server/sherlock/3133/couchbase-server-enterprise_4.0.0-3133-ubuntu14.04_amd64.deb && \
    dpkg -i couchbase-server-enterprise_4.0.0-3133-ubuntu14.04_amd64.deb

RUN wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add - && \ 
    sudo wget -O/etc/apt/sources.list.d/couchbase.list \
    http://packages.couchbase.com/ubuntu/couchbase-ubuntu1204.list && \
    sudo apt-get update && \
    sudo apt-get install -y libcouchbase2-libevent libcouchbase-dev

ADD bootstrap.sh /home/
ADD confsed.lin64.gz /usr/local/sbin/confsed.gz
ADD populate_views.sh /home/
ADD security_framework_init.js /home/
RUN gzip -d /usr/local/sbin/confsed.gz
RUN chmod 755 /usr/local/sbin/confsed


ENTRYPOINT ["/home/bootstrap.sh"]

    






