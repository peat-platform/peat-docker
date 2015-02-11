#echo "$1"

NODE_INT=`ip route | awk '/^default/ { print $5 }'`
NODE_ADDR=`ip route | egrep "^[0-9].*$NODE_INT" | awk '{ print $9 }'`

service couchbase-server start
/bin/sleep 20

if [ -z "$DOCKER_EXT_ADDR" ]
then
    DOCKER_EXT_ADDR="$NODE_ADDR"
fi

/opt/couchbase/bin/couchbase-cli cluster-init --cluster=127.0.0.1:8091 --user=admin --password=password --cluster-ramsize=2372
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=objects     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=types       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=attachments --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=permissions --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=users       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=clients     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=dbkeys      --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password

echo "{\"$addr\": \"$DOCKER_EXT_ADDR\", \"127.0.0.1\": \"$DOCKER_EXT_ADDR\"}" > /tmp/confsed.json

exec /usr/local/sbin/confsed -rewriteconf /tmp/confsed.json http://localhost:8091/
