#!/bin/bash

CBASE_ADDR=localhost

sudo service elasticsearch start
sudo service logstash start

curl -v -u admin:password http://$CBASE_ADDR:8091/pools/default/remoteClusters -d name=elasticsearch -d hostname=localhost:9091 -d username=admin -d password=password
curl -v -X POST -u admin:password http://$CBASE_ADDR:8091/controller/createReplication -d fromBucket=objects -d toCluster=elasticsearch -d toBucket=objects -d replicationType=continuous -d type=capi

bash
