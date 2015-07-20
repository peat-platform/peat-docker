#!/usr/bin/env bash

npm install json.sh


docker build -t openiicteu/cloudlet_core   cloudlet_core/
docker build -t openiicteu/mongrel2        mongrel2/
docker build -t openiicteu/couchbase       couchbase/
docker build -t openiicteu/elasticsearch   elasticsearch/
docker build -t openiicteu/admin-dashboard admin-dashboard/
docker build -t openiicteu/user-dashboard  user-dashboard/
docker build -t openiicteu/auth-dialogs    auth-dialogs/


docker build -t openiicteu/cloudlet_platform  cloudlet_platform/