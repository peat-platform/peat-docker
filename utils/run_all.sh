#!/bin/sh

#                 Container                     Link                Image                          Command
docker run -d --name openidao                                      openiicteu/dao             node dao/lib/docker-runner.js
docker run -d --name openiauthapi          --link openidao:dao     openiicteu/authapi         node auth-api/lib/docker-runner.js
docker run -d --name openicomms            --link openidao:dao     openiicteu/communications  node communications/lib/docker-runner.js
docker run -d --name openiattachmentapi    --link openidao:dao     openiicteu/attachmentapi   node attachment-api/lib/docker-runner.js
docker run -d --name openiobjectapi        --link openidao:dao     openiicteu/objectapi       node object-api/lib/docker-runner.js
docker run -d --name openipermissionsapi   --link openidao:dao     openiicteu/permissionsapi  node permissions_api/lib/docker-runner.js
docker run -d --name openiswagger          --link openidao:dao     openiicteu/swaggerdef      node swagger-def/lib/docker-runner.js
docker run -d --name openicloudletapi      --link openidao:dao     openiicteu/cloudletapi     node cloudlet-api/lib/docker-runner.js
docker run -d --name openinotifications    --link openicomms:comms \
                                           --link openidao:dao     openiicteu/notifications   node notifications/lib/docker-runner.js
docker run -d --name openisearchapi        --link openidao:dao     openiicteu/searchapi       node search_api/lib/docker-runner.js
docker run -d --name openitypeapi          --link openidao:dao     openiicteu/typeapi         node type-api/lib/docker-runner.js





