# This file creates a Docker image containing the Couchbase DB

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

RUN mkdir /opt/openi/

ADD configure.sh /opt/openi/
ADD setup.sh /opt/openi/

RUN apt-get update && apt-get install -y bash wget software-properties-common curl && \
    wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
    add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main" && \
    add-apt-repository "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" && \
    apt-get update && apt-get install elasticsearch && apt-get install -y logstash && \
    cd /etc/logstash/conf.d && wget --quiet https://gist.githubusercontent.com/philipobrien/c030717feeab0a74b1db/raw/cf859ec4063048868c9384e7cc23ee0d10a4994b/logstash-cloudlet.conf && \
    sed -i 's/start on virtual-filesystems/start on never/g' /etc/init/logstash-web.conf && \
    update-rc.d elasticsearch defaults 95 10 && \
    /usr/share/elasticsearch/bin/plugin -install transport-couchbase -url http://packages.couchbase.com.s3.amazonaws.com/releases/elastic-search-adapter/2.0.0/elasticsearch-transport-couchbase-2.0.0.zip && \
    /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head && \
    /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/master && \
    mkdir /usr/share/elasticsearch/templates && \
    wget https://raw.githubusercontent.com/couchbaselabs/elasticsearch-transport-couchbase/master/src/main/resources/couchbase_template.json -P /usr/share/elasticsearch/templates && \
    bash /opt/openi/configure.sh

ENTRYPOINT ["bash", "/opt/openi/setup.sh"]    






