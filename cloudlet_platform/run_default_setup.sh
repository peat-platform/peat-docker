#!/usr/bin/env bash

#add default ports to config

source conf

dao_proxy=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["dao_proxy"*"\]' | sed -e 's/\[\"dao_proxy\"\]//g')
dao=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["dao"*"\]' | sed -e 's/\[\"dao\"\]//g')
perms_propagator=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["perms_propagator_b"*"\]' | sed -e 's/\[\"perms_propagator_b\"\]//g')
swagger_def_https=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["swagger_def_https"*"\]' | sed -e 's/\[\"swagger_def_https\"\]//g')
swagger_def_http=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["swagger_def_http"*"\]' | sed -e 's/\[\"swagger_def_http\"\]//g')
type_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["type_api"*"\]' | sed -e 's/\[\"type_api\"\]//g')
object_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["object_api"*"\]' | sed -e 's/\[\"object_api\"\]//g')
cloudlet_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["cloudlet_api"*"\]' | sed -e 's/\[\"cloudlet_api\"\]//g')
attachments_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["attachments_api"*"\]' | sed -e 's/\[\"attachments_api\"\]//g')
search_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["search_api"*"\]' | sed -e 's/\[\"search_api\"\]//g')
permissions_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["permissions_api"*"\]' | sed -e 's/\[\"permissions_api\"\]//g')
notifications=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["notifications"*"\]' | sed -e 's/\[\"notifications\"\]//g')
auth_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["auth_api"*"\]' | sed -e 's/\[\"auth_api\"\]//g')
crud_api=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["crud_api"*"\]' | sed -e 's/\[\"crud_api\"\]//g')
peat_rrd=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["peat_rrd"*"\]' | sed -e 's/\[\"peat_rrd\"\]//g')
https_redirect=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["https_redirect"*"\]' | sed -e 's/\[\"https_redirect\"\]//g')
peat_aggregator=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["peat_aggregator"*"\]' | sed -e 's/\[\"peat_aggregator\"\]//g')


#                 Container                                                                               Image
docker run -d --name peatcb        -v $COUCHBASE_DATA_PATH:/opt/couchbase/var/lib/couchbase/ -p 80:80 -p 443:443 -p 9200:9200 -p 8091:8091 -p 8092:8092 -p 8093:8093 -p 8443:8443 peatplatform/couchbase
sleep 30
docker run -d --name peates                                         --net=container:peatcb	peatplatform/elasticsearch

docker run -d --name peatdao_proxy --net=container:peatcb  peatplatform/cloudlet_platform 	-w dao_proxy            -c "$dao_proxy"
sleep 4
docker run -d --name peatperms_proxy --net=container:peatcb peatplatform/cloudlet_platform 	-w perms_prop_worker    -c "$perms_propagator"

docker run -d --name dao_1    -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/     --net=container:peatcb	peatplatform/cloudlet_platform 	-w dao                  -c "$dao"
docker run -d --name dao_2    -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/     --net=container:peatcb	peatplatform/cloudlet_platform 	-w dao                  -c "$dao"
docker run -d --name dao_3    -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/     --net=container:peatcb	peatplatform/cloudlet_platform 	-w dao                  -c "$dao"


docker run -d --name swagger_def_https  -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/ --net=container:peatcb peatplatform/cloudlet_platform    -w swagger_def      -c "$swagger_def_https"

docker run -d --name swagger_def_http -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb peatplatform/cloudlet_platform 	-w swagger_def      -c "$swagger_def_http"

docker run -d --name type_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb peatplatform/cloudlet_platform    -w type_api         -c "$type_api"

docker run -d --name object_api       -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb peatplatform/cloudlet_platform 	-w object_api       -c "$object_api"

docker run -d --name cloudlet_api     -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w cloudlet_api     -c "$cloudlet_api"

docker run -d --name attachments_api  -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w attachments_api  -c "$attachments_api"

docker run -d --name search_api       -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w search_api       -c "$search_api"

docker run -d --name permissions_api  -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w permissions_api  -c "$permissions_api"

docker run -d --name notifications    -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w notifications    -c "$notifications"

docker run -d --name auth_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w auth_api         -c "$auth_api"

docker run -d --name crud_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w crud_api         -c "$crud_api"

docker run -d --name peat_rrd        -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w peat_rrd        -c "$peat_rrd"

docker run -d --name https_redirect   -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w https_redirect   -c "$https_redirect"

docker run -d --name peat_aggregator -v $LOG_OUTPUT_PATH_ROOT:/opt/peat/cloudlet_platform/logs/   --net=container:peatcb	peatplatform/cloudlet_platform 	-w peat_aggregator -c "$peat_aggregator"


admin_key=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["admin-dash","key"*"\]' | sed -e 's/\[\"admin-dash\",\"key\"\]//g')
user_key=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["user-dash","key"*"\]' | sed -e 's/\[\"user-dash\",\"key\"\]//g')
auth_secret=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["auth-dialog","secret"*"\]' | sed -e 's/\[\"auth-dialog\",\"secret\"\]//g')
auth_key=$( cat cloudlet_platform/conf.json | json.sh -p | egrep '\["auth-dialog","key"*"\]' | sed -e 's/\[\"auth-dialog\",\"key\"\]//g')

docker run -d --name peatadmindash                                                                 --net=container:peatcb	peatplatform/admin-dashboard                      -p "$admin_key"
docker run -d --name peatuserdash                                                                  --net=container:peatcb	peatplatform/user-dashboard                       -p "$user_key"
docker run -d --name peatauthdialogs                                                               --net=container:peatcb	peatplatform/auth-dialogs     -s "$auth_secret"   -p "$auth_key"

docker run -d --name peatmongrel2    -v $LOG_OUTPUT_PATH_ROOT:/mongrel2/logs/                      --net=container:peatcb peatplatform/mongrel2
#docker run -d --name xyz                                  --net=container:peatcb	peatplatform/cloudlet_platform 	-w xyz -c ""

