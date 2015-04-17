#!/usr/bin/env bash

#add default ports to config


source conf

#                 Container                                                                               Image
docker run -d --name openicb        -v $COUCHBASE_DATA_PATH:/opt/couchbase/var/lib/couchbase/ -p 80:80 -p 443:443 -p 9200:9200 -p 8091:8091  openiicteu/couchbase
sleep 20
docker run -d --name openies                                         --net=container:openicb   openiicteu/elasticsearch

docker run -d --name openidao_proxy                                                           --net=container:openicb  openiicteu/cloudlet_platform  -w dao_proxy -c '{ "frontend"      : "tcp://127.0.0.1:49999", "backend"       : "tcp://127.0.0.1:49997"}'
sleep 4

docker run -d --name dao_1    -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/     --net=container:openicb   openiicteu/cloudlet_platform  -w dao -c '{ "dao_sink"       : {"spec":"tcp://127.0.0.1:49997", "bind":false, "id":"q1", "type":"pull" }, "sub_sink"       : {"spec":"tcp://127.0.0.1:49500", "bind":false, "id":"subpush", "type":"pub" }, "logger_params"  : { "path"      : "/opt/openi/cloudlet_platform/logs/dao", "log_level" : "debug", "as_json"   : true}}'
docker run -d --name dao_2    -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/     --net=container:openicb   openiicteu/cloudlet_platform  -w dao -c '{ "dao_sink"       : {"spec":"tcp://127.0.0.1:49997", "bind":false, "id":"q1", "type":"pull" }, "sub_sink"       : {"spec":"tcp://127.0.0.1:49500", "bind":false, "id":"subpush", "type":"pub" }, "logger_params"  : { "path"      : "/opt/openi/cloudlet_platform/logs/dao", "log_level" : "debug", "as_json"   : true}}'
docker run -d --name dao_3    -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/     --net=container:openicb   openiicteu/cloudlet_platform  -w dao -c '{ "dao_sink"       : {"spec":"tcp://127.0.0.1:49997", "bind":false, "id":"q1", "type":"pull" }, "sub_sink"       : {"spec":"tcp://127.0.0.1:49500", "bind":false, "id":"subpush", "type":"pub" }, "logger_params"  : { "path"      : "/opt/openi/cloudlet_platform/logs/dao", "log_level" : "debug", "as_json"   : true}}'

docker run -d --name swagger_def_https -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/      --net=container:openicb   openiicteu/cloudlet_platform  -w swagger_def -c '{"mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49907", "id":"g", "bind":false, "type":"pull", "isMongrel2":true, "error_handle":"tcp://127.0.0.1:49904" }, "sink"   : { "spec":"tcp://127.0.0.1:49908", "id":"h", "bind":false, "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/swagger-def", "log_level": "info", "as_json"  : true }}'
docker run -d --name swagger_def_http -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/       --net=container:openicb   openiicteu/cloudlet_platform  -w swagger_def -c '{"mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49907", "id":"g", "bind":false, "type":"pull", "isMongrel2":true, "error_handle":"tcp://127.0.0.1:49904" }, "sink"   : { "spec":"tcp://127.0.0.1:49908", "id":"h", "bind":false, "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/swagger-def-http", "log_level": "info", "as_json"  : true }}'
docker run -d --name type_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/       --net=container:openicb  openiicteu/cloudlet_platform -w type_api -c '{ "dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"a" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49905", "bind":false, "id":"b", "type":"pull", "isMongrel2":true }, "sink"   : { "spec":"tcp://127.0.0.1:49906", "bind":false, "id":"c", "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/type_api", "log_level": "debug", "as_json"  : false }, "monitoring" : { "type" : { "get"  : ["id_only"], "post" : [], "put"  : [], "delete" : [] } }}'
docker run -d --name object_api       -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w object_api       -c '{"dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"d" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49903", "id":"e", "bind":false, "type":"pull", "isMongrel2":true },  "sink"   : { "spec":"tcp://127.0.0.1:49904", "id":"f", "bind":false, "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/object_api", "log_level": "debug", "as_json"  : true }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----", "monitoring" : { "object" : { "get"  : ["id_only","resolve"], "post"  : [], "put"  : [], "delete" : [] } }, "tracklet" : { "piwik" : { "token_auth" : "90871c8584ddf2265f54553a305b6ae1", "domain" : "http://localhost:8888/piwik/" }, "mysql" : { "host" : "localhost", "user" : "piwik", "password" : "password", "database" : "piwik", "multipleStatements" : "true" } }}'
docker run -d --name cloudlet_api     -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w cloudlet_api     -c '{"dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"a" },  "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49901", "bind":false, "type": "pull", "isMongrel2":true, "id":"b" }, "sink"   : { "spec":"tcp://127.0.0.1:49902", "bind":false, "type": "pub",  "isMongrel2":true, "id":"c" } }, "logger_params" : {  "path"     : "/opt/openi/cloudlet_platform/logs/cloudlet_api", "log_level": "debug", "as_json"  : true }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----", "monitoring" : { "cloudlet" : { "get"  : ["all"], "post"  : [], "put"  : [], "delete" : [] } }}'
docker run -d --name attachments_api  -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w attachments_api  -c '{ "dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"d" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49913", "id":"e3", "bind":false, "type":"pull", "isMongrel2":true }, "sink"   : { "spec":"tcp://127.0.0.1:49914", "id":"f3", "bind":false, "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/attachment_api", "log_level": "debug", "as_json"  : true },"trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----"}'
docker run -d --name search_api       -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w search_api       -c '{"dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"d" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49911", "id":"e", "bind":false, "type":"pull", "isMongrel2":true, "error_handle":"tcp://127.0.0.1:49904" }, "sink"   : { "spec":"tcp://127.0.0.1:49912", "id":"f", "bind":false, "type":"pub",  "isMongrel2":true } }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/search_api", "log_level": "debug", "as_json"  : true }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----"}'
docker run -d --name permissions_api  -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w permissions_api  -c '{ "dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"a" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49909", "bind":false, "type": "pull", "isMongrel2":true, "id":"b" }, "sink"   : { "spec":"tcp://127.0.0.1:49910", "bind":false, "type": "pub",  "isMongrel2":true, "id":"c" } }, "internal_handler" : { "source" : {"spec" : "tcp://127.0.0.1:49570", "bind" : true,  "subscribe": "", "type" : "sub", "id" : "Authsource"}, "sink"   : {"spec" : "tcp://127.0.0.1:49570 ", "bind" : false, "subscribe": "", "type" : "pub", "id" : "AuthSink", "asJson": true} }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/permissions_api", "log_level": "debug", "as_json"  : true }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----"}'
docker run -d --name notifications    -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w notifications    -c '{"notif_sink"        : {"spec" : "tcp://127.0.0.1:49500", "bind" : true, "type" : "sub", "subscribe" : "", "id" : "NotificationReceiver"}, "notif_broadcaster" : {"spec" : "tcp://127.0.0.1:49501", "bind" : true, "type" : "pub", "id" : "NotificationBroadcaster"}, "dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"dao_sink" }, "mongrel_handler" : { "source"    : { "spec" : "tcp://127.0.0.1:49503", "id" : "e", "bind" : false, "type" : "pull", "isMongrel2" : true },  "sink"      : { "spec" : "tcp://127.0.0.1:49504", "id" : "NotifReceiver", "bind" : false, "type" : "pub", "isMongrel2" : true }, "subsource" : { "spec" : "tcp://127.0.0.1:49505", "id" : "f", "bind" : false, "type" : "pull", "isMongrel2" : true }, "subsink"   : { "spec" : "tcp://127.0.0.1:49506", "id" : "subReceiver", "bind" : false, "type" : "pub", "isMongrel2" : true } }, "comms"           : { "sink" : { "spec" : "tcp://127.0.0.1:49998", "bind" : false, "type" : "push", "id" : "communication_id" } }, "logger_params"   : { "path"      : "/opt/openi/cloudlet_platform/logs/notification.log", "log_level" : "debug", "as_json"   : false }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----"}'
docker run -d --name auth_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w auth_api         -c '{ "dao_sink"        : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"a" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49917", "bind":false, "id":"b", "type":"pull", "isMongrel2":true }, "sink"   : { "spec":"tcp://127.0.0.1:49918", "bind":false, "id":"c", "type":"pub", "isMongrel2":true } }, "api_handler" : { "source" : {"spec" : "tcp://127.0.0.1:49559", "bind" : true, "subscribe": "", "type" : "sub", "id" : "Authsource"}, "sink" : {"spec" : "tcp://127.0.0.1:49559", "bind" : false, "subscribe": "", "type" : "pub", "id" : "AuthSink", "asJson": true} }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/crud_api", "log_level": "debug", "as_json"  : false }, "key": { "sign": "-----BEGIN RSA PRIVATE KEY-----\nMIIBOQIBAAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0vWXBEkk2pV42HsxKAmPs\n789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQJAVCNxShi7ggXQVUlUxdAf\ndvNrnKW1XKg/Rns15hx2LRq+6oKv0RsPH3N4P64ZYDt62Yf0o1uLC66YtVgf5BgN\nmQIhANCAIYQ3KSXLLmDW/wSCE85eOipP7Duxaan694LdO8+XAiEAypKs/I9t7Ef5\nk4zpmm1/qS7ht/LWr+FsqHPB1nQ9m/8CIE19YXeHHLbcJbd+EDd3tK69HHb/Tzf8\nPt4a1QSA/qqvAiBLupGYyTXawv12P5OE+7Jh2Pjg/5NqpOcuAjhQp5vwmQIgNFWQ\n-----END RSA PRIVATE KEY-----", "verify": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----"}, "tracklet" : { "piwik" : { "token_auth" : "90871c8584ddf2265f54553a305b6ae1", "domain" : "http://localhost:8888/piwik/" }, "mysql" : { "host" : "localhost", "user" : "piwik", "password" : "password", "database" : "piwik", "multipleStatements" : "true" }}}'
docker run -d --name crud_api         -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w crud_api         -c '{ "dao_sink" : {"spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"a"  }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49915", "bind":false, "id":"b", "type":"pull", "isMongrel2":true },  "sink"   : { "spec":"tcp://127.0.0.1:49916", "bind":false, "id":"c", "type":"pub", "isMongrel2":true  } }, "api_handler" : { "source" : {"spec" : "tcp://127.0.0.1:49557", "bind" : true,  "subscribe": "", "type" : "sub", "id" : "CRUDsource"}, "sink"   : {"spec" : "tcp://127.0.0.1:49557", "bind" : false, "subscribe": "", "type" : "pub", "id" : "CRUDSink", "asJson": true} }, "logger_params" : { "path"     : "/opt/openi/cloudlet_platform/logs/crud_api", "log_level": "debug",  "as_json"  : false }}'
docker run -d --name openi_rrd        -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w openi_rrd        -c '{ "cloudlet" : { "get"  : ["all"], "post"  : [], "put"  : [],  "delete" : [] }, "object"   : { "get"  : ["id_only","resolve"], "post"  : [],  "put"  : [], "delete" : [] }, "type"     : { "get"  : ["id_only"],  "post"  : [], "put"  : [], "delete" : [] },  "graphs"   : { "openi_cloudlet_api_report" : { "openi_cloudlet_get" : {  "color"  : "0F6AB4",   "label"  : "GET"}, "openi_cloudlet_put"  : {  "color"  : "C5862B",   "label"  : "PUT"}, "openi_cloudlet_post"  : {  "color"  : "10A54A",   "label"  : "POST"}, "openi_cloudlet_delete" : {  "color"  : "A41E22",   "label"  : "DELETE"} }, "openi_cloudlet_stats_report" : {  "openi_cloudlet_get" : {  "color"  : "C5862B",   "label"  : "GET"}, "openi_cloudlet_get_all" : {  "color"  : "99CC00",   "label"  : "GET ALL"} }, "openi_object_api_report" : {"openi_object_get" : {  "color"  : "0F6AB4",   "label"  : "GET"}, "openi_object_put"  : {  "color"  : "C5862B",   "label"  : "PUT"}, "openi_object_post"  : {  "color"  : "10A54A",   "label"  : "POST"}, "openi_object_delete" : {  "color"  : "A41E22",   "label"  : "DELETE"} }, "openi_object_stats_report" : {"openi_object_get" : {  "color"  : "0F6AB4",   "label"  : "GET"}, "openi_object_get_id_only" : {  "color"  : "009999",   "label"  : "ID ONLY"}, "openi_object_get_resolve" : {  "color"  : "3333CC",   "label"  : "RESOLVE"} }, "openi_type_api_report"  : { "openi_type_get"  : {  "color"  : "0F6AB4",   "label"  : "GET"}, "openi_type_put"   : {  "color"  : "C5862B",   "label"  : "PUT"}, "openi_type_post"  : {  "color"  : "10A54A",   "label"  : "POST"}, "openi_type_delete" : {  "color"  : "A41E22",   "label"  : "DELETE"} }}}'
docker run -d --name https_redirect   -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w https_redirect        -c '{ "in_m"   : { "spec":"tcp://127.0.0.1:50000", "bind":false, "type": "pull", "isMongrel2":true, "id":"ra" }, "out_m" : { "spec":"tcp://127.0.0.1:50001", "bind":false, "type": "pub",  "isMongrel2":true, "id":"rb" }}'

docker run -d --name openi_aggregator -v $LOG_OUTPUT_PATH_ROOT:/opt/openi/cloudlet_platform/logs/        --net=container:openicb   openiicteu/cloudlet_platform  -w openi_aggregator -c '{ "dao_sink" : { "spec":"tcp://127.0.0.1:49999", "bind":false, "type":"push", "id":"d" }, "mongrel_handler" : { "source" : { "spec":"tcp://127.0.0.1:49925", "id":"e", "bind":false, "type":"pull", "isMongrel2":true, "error_handle":"tcp://127.0.0.1:49904" }, "sink" : { "spec":"tcp://127.0.0.1:49926", "id":"f", "bind":false, "type":"pub", "isMongrel2":true } }, "logger_params" : { "path" : "/opt/openi/cloudlet_platform/logs/aggregator", "log_level": "debug", "as_json" : true }, "trusted_security_framework_public_key": "-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----", "monitoring" : { "aggregator" : { "get" : [], "post"  : [] }  }}'

docker run -d --name openiadmindash                                  --net=container:openicb   openiicteu/admin-dashboard
docker run -d --name openiuserdash                                   --net=container:openicb   openiicteu/user-dashboard
docker run -d --name openiauthdialogs                                --net=container:openicb   openiicteu/auth-dialogs

docker run -d --name openimongrel2       -v $LOG_OUTPUT_PATH_ROOT:/mongrel2/logs/          --net=container:openicb   openiicteu/mongrel2

#docker run -d --name xyz                                  --net=container:openicb   openiicteu/cloudlet_platform  -w xyz -c ""


