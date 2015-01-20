#!/bin/sh

PATH_STUB=/home/openi

#                 Container                     Link                Image                          Command
docker run -d --name openidao                                      openi/dao              node $PATH_STUB/dao/lib/local-runner.js
docker run -d --name openicomms            --link openidao:dao     openi/communications   node $PATH_STUB/communications/lib/local-runner.js
docker run -d --name openiattachmentapi    --link openidao:dao     openi/attachmentapi    node $PATH_STUB/attachment-api/lib/local-runner.js
docker run -d --name openiobjectapi        --link openidao:dao     openi/objectapi        node $PATH_STUB/object-api/lib/local-runner.js
docker run -d --name openipermissionsapi   --link openidao:dao     openi/permissionsapi   node $PATH_STUB/permissions_api/lib/local-runner.js
docker run -d --name openiswagger          --link openidao:dao     openi/swaggerdef       node $PATH_STUB/swagger-def/lib/local-runner.js
docker run -d --name openicloudletapi      --link openidao:dao     openi/cloudletapi      node $PATH_STUB/cloudlet-api/lib/local-runner.js
docker run -d --name openinotifications    --link openicomms:comms \
                                           --link openidao:dao     openi/notifications    node $PATH_STUB/notifications/lib/local-runner.js
docker run -d --name searchapi             --link openidao:dao     openi/searchapi        node $PATH_STUB/search_api/lib/local-runner.js
docker run -d --name typeapi               --link openidao:dao     openi/typeapi          node $PATH_STUB/type-api/lib/local-runner.js





