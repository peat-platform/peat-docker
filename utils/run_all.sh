#!/bin/sh


sleep 60
docker run -d --name peates                                         --net=container:peatcb   peatplatform/elasticsearch
docker run -d --name peatnotifications  -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/notifications
docker run -d --name peatauthapi        -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/authapi
docker run -d --name peatattachmentapi  -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/attachmentapi
docker run -d --name peatobjectapi      -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/objectapi
docker run -d --name peatpermissionsapi -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/permissionsapi
docker run -d --name peatswagger        -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/swaggerdef
docker run -d --name peatcloudletapi    -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/cloudletapi
docker run -d --name peatsearchapi      -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/searchapi
docker run -d --name peattypeapi        -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/typeapi
docker run -d --name peathttpswagger    -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/httpswaggerdef
docker run -d --name peatredirect                                   --net=container:peatcb   peatplatform/redirect
docker run -d --name peatadmindash                                  --net=container:peatcb   peatplatform/admin-dashboard
docker run -d --name peatuserdash                                   --net=container:peatcb   peatplatform/user-dashboard
docker run -d --name peatauthdialogs                                --net=container:peatcb   peatplatform/auth-dialogs
docker run -d --name peatdao            -v $OUTPUT_PATH:$C_LOG_PATH --net=container:peatcb   peatplatform/dao



