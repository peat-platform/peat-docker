#!/bin/sh

#                 Container                                              Image
docker run -d --name openidao            -p 80:80 -p 443:443        openiicteu/dao
docker run -d --name openicomms          --net=container:openidao   openiicteu/communications
docker run -d --name openinotifications  --net=container:openidao   openiicteu/notifications
docker run -d --name openiauthapi        --net=container:openidao   openiicteu/authapi
docker run -d --name openiattachmentapi  --net=container:openidao   openiicteu/attachmentapi
docker run -d --name openiobjectapi      --net=container:openidao   openiicteu/objectapi
docker run -d --name openipermissionsapi --net=container:openidao   openiicteu/permissionsapi
docker run -d --name openiswagger        --net=container:openidao   openiicteu/swaggerdef
docker run -d --name openicloudletapi    --net=container:openidao   openiicteu/cloudletapi
docker run -d --name openisearchapi      --net=container:openidao   openiicteu/searchapi
docker run -d --name openitypeapi        --net=container:openidao   openiicteu/typeapi
docker run -d --name openimongrel2       --net=container:openidao   openiicteu/mongrel2





