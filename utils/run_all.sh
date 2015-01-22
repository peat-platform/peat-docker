#!/bin/sh

PATH_STUB=/home/openi

#                 Container                     Link                Image                          Command
docker run -d --name openidao                                      openiicteu/dao                 node $PATH_STUB/dao/lib/local-runner.js
docker run -d --name openiauthapi          --link openidao:dao     openiicteu/authapi             node $PATH_STUB/auth-api/lib/local-runner.js
docker run -d --name openicomms            --link openidao:dao     openiicteu/communications      node $PATH_STUB/communications/lib/local-runner.js
docker run -d --name openiattachmentapi    --link openidao:dao     openiicteu/attachmentapi       node $PATH_STUB/attachment-api/lib/local-runner.js
docker run -d --name openiobjectapi        --link openidao:dao     openiicteu/objectapi           node $PATH_STUB/object-api/lib/local-runner.js
docker run -d --name openipermissionsapi   --link openidao:dao     openiicteu/permissionsapi      node $PATH_STUB/permissions_api/lib/local-runner.js
docker run -d --name openiswagger          --link openidao:dao     openiicteu/swaggerdef          node $PATH_STUB/swagger-def/lib/local-runner.js
docker run -d --name openicloudletapi      --link openidao:dao     openiicteu/cloudletapi         node $PATH_STUB/cloudlet-api/lib/local-runner.js
docker run -d --name openinotifications    --link openicomms:comms \
                                           --link openidao:dao     openiicteuicteu/notifications  node $PATH_STUB/notifications/lib/local-runner.js
docker run -d --name openisearchapi        --link openidao:dao     openiicteu/searchapi           node $PATH_STUB/search_api/lib/local-runner.js
docker run -d --name openitypeapi          --link openidao:dao     openiicteu/typeapi             node $PATH_STUB/type-api/lib/local-runner.js





