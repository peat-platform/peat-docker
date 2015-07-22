#!/bin/sh

docker build -t peatplatform/dao             dao/
docker build -t peatplatform/dao_proxy       dao_proxy/
docker build -t peatplatform/authapi         auth_api/
docker build -t peatplatform/typeapi         type_api/
docker build -t peatplatform/redirect        redirect/
docker build -t peatplatform/mongrel2        mongrel2/
docker build -t peatplatform/couchbase       couchbase/
docker build -t peatplatform/searchapi       search_api/
docker build -t peatplatform/objectapi       object_api/
docker build -t peatplatform/swaggerdef      swagger_def/
docker build -t peatplatform/cloudletapi     cloudlet_api/
docker build -t peatplatform/auth-dialogs    auth-dialogs/
docker build -t peatplatform/elasticsearch   elasticsearch/
docker build -t peatplatform/notifications   notifications/
docker build -t peatplatform/attachmentapi   attachment_api/
docker build -t peatplatform/permissionsapi  permissions_api/
docker build -t peatplatform/httpswaggerdef  http_swagger_def/
docker build -t peatplatform/admin-dashboard admin-dashboard/
docker build -t peatplatform/user-dashboard  user-dashboard/


docker build -t peatplatform/cloudlet_platform  cloudlet_platform/
