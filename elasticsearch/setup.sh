#!/bin/bash

CBASE_ADDR=127.0.0.1

sudo service elasticsearch start
sudo service logstash start

until $(curl --output /dev/null --silent --head --fail http://localhost:9200); do
   printf '.'
   sleep 5
done

curl -v -u admin:password http://$CBASE_ADDR:8091/pools/default/remoteClusters -d name=elasticsearch -d hostname=$CBASE_ADDR:9091 -d username=admin -d password=password

#curl --retry 10 -XPUT http://localhost:9200/objects/ -d '{"index":{"analysis":{"analyzer":{"default":{"type":"whitespace","tokenizer":"whitespace"}}}}}'

curl -XPUT 'http://localhost:9200/objects/' -d '{
    "settings" : {
        "number_of_shards" : 5,
        "number_of_replicas" : 1
   }
}'

sleep 20

curl -v -X POST -u admin:password http://$CBASE_ADDR:8091/controller/createReplication -d fromBucket=objects -d toCluster=elasticsearch -d toBucket=objects -d replicationType=continuous -d type=capi

sudo update-rc.d elasticsearch defaults 95 10

/usr/share/elasticsearch/bin/elasticsearch
