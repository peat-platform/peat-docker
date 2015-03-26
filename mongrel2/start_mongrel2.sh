mkdir logs run tmp

bash populate_couchbase_views.sh

m2sh load -config cloudlet_platform.conf -db cloudlet_platform.db

sudo m2sh start -db cloudlet_platform.db -name Http_Redirect &
sudo m2sh start -db cloudlet_platform.db -name Cloudlet_Platform
