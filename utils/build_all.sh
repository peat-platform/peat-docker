#!/bin/sh

docker build -t openiicteu/dao            dao/
docker build -t openiicteu/authapi        auth_api/
docker build -t openiicteu/typeapi        type_api/
docker build -t openiicteu/mongrel2       mongrel2/
docker build -t openiicteu/couchbase      couchbase/
docker build -t openiicteu/searchapi      search_api/
docker build -t openiicteu/objectapi      object_api/
docker build -t openiicteu/swaggerdef     swagger_def/
docker build -t openiicteu/cloudletapi    cloudlet_api/
docker build -t openiicteu/notifications  notifications/
docker build -t openiicteu/attachmentapi  attachment_api/
docker build -t openiicteu/communications communications/
docker build -t openiicteu/permissionsapi permissions_api/

