#!/bin/sh

HOST_LOG_PATH="/"
CONT_LOG_PATH="/opt/openi/cloudlet_platform/logs/"

CB_LOG_PATH="/opt/couchbase/var"

#                 Container                                                                               Image
docker run -d --name openicb  -p 80:80 -p 443:443 -p 8091:8091 openiicteu/couchbase
sleep 60
docker run -d --name openidao            -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/dao
docker run -d --name openicomms          -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/communications
docker run -d --name openinotifications  -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/notifications
docker run -d --name openiauthapi        -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/authapi
docker run -d --name openiattachmentapi  -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/attachmentapi
docker run -d --name openiobjectapi      -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/objectapi
docker run -d --name openipermissionsapi -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/permissionsapi
docker run -d --name openiswagger        -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/swaggerdef
docker run -d --name openicloudletapi    -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/cloudletapi
docker run -d --name openisearchapi      -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/searchapi
docker run -d --name openitypeapi        -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/typeapi
docker run -d --name openimongrel2       -v $HOST_LOG_PATH:$CONT_LOG_PATH --net=container:openicb   openiicteu/mongrel2




