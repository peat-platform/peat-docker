#!/bin/sh

docker build -t openiicteu/dao:0.5.0             dao/
docker build -t openiicteu/authapi:0.5.0         auth_api/
docker build -t openiicteu/typeapi:0.5.0         type_api/
docker build -t openiicteu/redirect:0.5.0        redirect/
docker build -t openiicteu/mongrel2:0.5.0        mongrel2/
docker build -t openiicteu/couchbase:0.5.0       couchbase/
docker build -t openiicteu/searchapi:0.5.0       search_api/
docker build -t openiicteu/objectapi:0.5.0       object_api/
docker build -t openiicteu/swaggerdef:0.5.0      swagger_def/
docker build -t openiicteu/cloudletapi:0.5.0     cloudlet_api/
docker build -t openiicteu/auth-dialogs:0.5.0    auth-dialogs/
docker build -t openiicteu/elasticsearch:0.5.0   elasticsearch/
docker build -t openiicteu/notifications:0.5.0   notifications/
docker build -t openiicteu/attachmentapi:0.5.0   attachment_api/
docker build -t openiicteu/permissionsapi:0.5.0  permissions_api/
docker build -t openiicteu/httpswaggerdef:0.5.0  http_swagger_def/
docker build -t openiicteu/admin-dashboard:0.5.0 admin-dashboard/
docker build -t openiicteu/user-dashboard:0.5.0  user-dashboard/
