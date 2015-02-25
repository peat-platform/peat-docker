#!/bin/bash

sudo service elasticsearch start
sudo service logstash start

sudo bash -c "echo couchbase.password: password >> /etc/elasticsearch/elasticsearch.yml"
sudo bash -c "echo couchbase.username: admin >> /etc/elasticsearch/elasticsearch.yml"
sudo bash -c "echo couchbase.maxConcurrentRequests: 1024 >> /etc/elasticsearch/elasticsearch.yml"

mkdir /usr/share/elasticsearch/bin/config/
mv /etc/elasticsearch/logging.yml /usr/share/elasticsearch/bin/config/


