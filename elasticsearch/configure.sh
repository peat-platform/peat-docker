#!/bin/bash

sudo service elasticsearch start
sudo service logstash start

sudo bash -c "echo couchbase.password: password >> /etc/elasticsearch/elasticsearch.yml"
sudo bash -c "echo couchbase.username: admin >> /etc/elasticsearch/elasticsearch.yml"
sudo bash -c "echo couchbase.maxConcurrentRequests: 1024 >> /etc/elasticsearch/elasticsearch.yml"

until $(curl --output /dev/null --silent --head --fail http://localhost:9200); do
   printf '.'
   sleep 5
done

curl --retry 10 -XPUT http://localhost:9200/objects/ -d '{"index":{"analysis":{"analyzer":{"default":{"type":"whitespace","tokenizer":"whitespace"}}}}}'

