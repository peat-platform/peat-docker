#!/bin/sh

C_LOG_PATH="/opt/openi/cloudlet_platform/logs/"

CB_LOG_PATH="/opt/couchbase/var/lib/couchbase/logs/"

M_LOG_PATH="/mongrel2/logs/"

source conf

#                 Container                                                                               Image
docker run -d --name openicb -v $LOG_PATH:$CB_LOG_PATH -p 443:443 -p 80:80 -p 8091:8091  openiicteu/couchbase
sleep 60
docker run -d --name openidao            -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/dao
docker run -d --name openinotifications  -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/notifications
docker run -d --name openiauthapi        -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/authapi
docker run -d --name openiattachmentapi  -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/attachmentapi
docker run -d --name openiobjectapi      -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/objectapi
docker run -d --name openipermissionsapi -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/permissionsapi
docker run -d --name openiswagger        -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/swaggerdef
docker run -d --name openicloudletapi    -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/cloudletapi
docker run -d --name openisearchapi      -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/searchapi
docker run -d --name openitypeapi        -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/typeapi
docker run -d --name openihttpswagger    -v $LOG_PATH:$C_LOG_PATH --net=container:openicb   openiicteu/httpswaggerdef
docker run -d --name openiredirect                                        --net=container:openicb   openiicteu/redirect
docker run -d --name openimongrel2       -v $LOG_PATH:$M_LOG_PATH --net=container:openicb   openiicteu/mongrel2




