#!/bin/sh

docker build -t openi/dao            dao/
docker build -t openi/typeapi        type_api/
docker build -t openi/searchapi      search_api/
docker build -t openi/objectapi      object_api/
docker build -t openi/swaggerdef     swagger_def/
docker build -t openi/cloudletapi    cloudlet_api/
docker build -t openi/notifications  notifications/
docker build -t openi/attachmentapi  attachment_api/
docker build -t openi/communications communications/
docker build -t openi/permissionsapi permissions_api/

