#!/usr/bin/env sh
NODE_INT=`ip route | awk '/^default/ { print $5 }'`
NODE_ADDR=`ip route | egrep "^[0-9].*$NODE_INT" | awk '{ print $9 }'`

cd /opt/couchbase
mkdir -p var/lib/couchbase var/lib/couchbase/config var/lib/couchbase/data \
      var/lib/couchbase/stats var/lib/couchbase/logs var/lib/moxi
sudo chmod -R 777 var

cd /home
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install couchbase

echo "Starting Couchbase Service..."
sudo service couchbase-server start
echo "Wait for Service..."

/bin/sleep 20

echo "Starting Couchbase Query Service..."
/opt/couchbase/bin/cbq-engine -datastore=http://localhost:8091/ &
echo "Wait for Service..."

sleep 5

if [ ! -d "/opt/couchbase/var/lib/couchbase/data/attachments/" ]; then
   echo "CREATE BUCKETS"
   /opt/couchbase/bin/couchbase-cli cluster-init --cluster=127.0.0.1:8091 --user=admin --password=password --cluster-ramsize=2372 --services="data;index;query"
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=objects     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=types       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=attachments --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=permissions --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=app_permissions --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=users       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=clients     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=dbkeys      --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
   echo "BUCKETS CREATED"
   sleep 5
fi

curl -v http://localhost:8093/query/service -d 'statement=CREATE PRIMARY INDEX `objects-index` ON `objects`;'
curl -v http://localhost:8093/query/service -d 'statement=CREATE PRIMARY INDEX `types-index` ON `types`;'
curl -v http://localhost:8093/query/service -d 'statement=CREATE PRIMARY INDEX `clients-index` ON `clients`;'
curl -v http://localhost:8093/query/service -d 'statement=CREATE PRIMARY INDEX `users-index` ON `users`;'

echo "CREATE DB_KEY and VIEWS"
cd /home
mkdir utils/
node security_framework_init.js
sh populate_views.sh

if [ -z "$DOCKER_EXT_ADDR" ]; then
    DOCKER_EXT_ADDR="$NODE_ADDR"
fi

#if [ "$1" = "join" ]; then
#   /opt/couchbase/bin/couchbase-cli server-add --cluster=127.0.0.1:8091 --user=admin --password=password --server-add="$NODE_ADDR":8091
#fi

echo "{\"$addr\": \"$DOCKER_EXT_ADDR\", \"127.0.0.1\": \"$DOCKER_EXT_ADDR\"}" > /tmp/confsed.json

exec /usr/local/sbin/confsed -rewriteconf /tmp/confsed.json http://localhost:8091/ 
