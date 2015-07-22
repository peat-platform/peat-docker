#!/usr/bin/env bash

npm install json.sh


docker build -t peatplatform/cloudlet_core   cloudlet_core/
docker build -t peatplatform/mongrel2        mongrel2/
docker build -t peatplatform/couchbase       couchbase/
docker build -t peatplatform/elasticsearch   elasticsearch/
docker build -t peatplatform/admin-dashboard admin-dashboard/
docker build -t peatplatform/user-dashboard  user-dashboard/
docker build -t peatplatform/auth-dialogs    auth-dialogs/


docker build -t peatplatform/cloudlet_platform  cloudlet_platform/