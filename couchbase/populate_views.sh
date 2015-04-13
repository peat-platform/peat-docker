#!/bin/bash


curl  -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "object_by_cloudlet_id": {
            "map": "function (doc, meta) {\n   \n  emit( [doc[\"@cloudlet\"], doc[\"@cloudlet\"]], doc[\"@id\"] );\n  \n  for ( i in doc._permissions){\n    \n    if ( doc._permissions[i][\"read\"] ){\n  \temit( [i, doc[\"@cloudlet\"]], doc[\"@id\"] );\n    }\n  }\n}",
             "reduce":"_count"
         },
         "object_by_type" : {
            "map" : "function (doc, meta) {\n   \n  emit( [doc[\"@cloudlet\"], doc[\"@openi_type\"], doc[\"@cloudlet\"]], [doc[\"@cloudlet\"], doc[\"@id\"]] );\n  \n  for ( i in doc._permissions){\n    \n    if ( doc._permissions[i][\"read\"] ){\n  \temit( [i, doc[\"@openi_type\"], doc[\"@cloudlet\"]], [doc[\"@cloudlet\"], doc[\"@id\"]] );\n    }\n    \n  }\n}",
            "reduce" : "_count"
         },
         "type_usage" : {
            "map" : "function (doc, meta) {\n  emit(doc[\"@openi_type\"], 1);\n}",
            "reduce" : "_count"
         },
         "object_data" : {
            "map" : "function (doc, meta) {\n emit(doc[\"@id\"], doc[\"@openi_type\"]);\n}"
         }
      }
   }' \
  http://admin:password@localhost:8092/objects/_design/objects_views


curl -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "cloudlet_list": {
            "map": "function (doc, meta) {\n\temit(doc[\"@cloudlet\"], 1);\n}",
            "reduce":"_count"
         }
      }
   }' \
  http://admin:password@localhost:8092/objects/_design/cloudlets_views

curl  -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "types_list": {
            "map": "function (doc, meta) {\n  emit(doc[\"@id\"], 1);\n}",
            "reduce":"_count"
         },
         "get_ref": {
            "map": "function (doc, meta) {\n\temit(doc[\"@id\"], doc[\"@reference\"]);\n}"
         }
      }
   }' \
  http://admin:password@localhost:8092/types/_design/type_views


  curl  -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "subs_by_objectId": {
            "map": "function (doc, meta) {\n  if (meta.id.indexOf(\"+s_\") !== -1) {\n    //var cloudlet = meta.id.split(\"+\")[0]\n    emit(doc.objectid, doc);\n  }\n}"
        }
      }
    }' \
  http://admin:password@localhost:8092/objects/_design/subscription_views


curl -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "clients_by_cloudlet_id": {
            "map": "function (doc, meta) {\n  emit(doc.cloudlet, doc); \n}",
             "reduce":"_count"
         }
      }
   }' \
  http://admin:password@localhost:8092/clients/_design/clients_views

  curl -X PUT \
  -H "Accept:application/json" \
  -H "Content-Type: application/json" \
  -d '{
      "views": {
         "app_permissions": {
            "map": "function (doc, meta) {\n  splitId = meta.id.split(\"_\")\n  if (Date.parse(splitId[splitId.length-1]) > 0) {\n    title = splitId[0]+\"_\"+splitId[1]\n    emit(title,doc[\"_current\"])\n  }\n}"
         }
      }
   }' \
  http://admin:password@localhost:8092/app_permissions/_design/permission_views


    curl  -X PUT \
    -H "Accept:application/json" \
    -H "Content-Type: application/json" \
    -d '{
        "views": {
           "app_permissions": {
              "map": "function (doc, meta) {\n splitId = meta.id.split(\"_\")\n emit([splitId[0], splitId[1]], meta.id)\n}",
              "reduce":"_count"
           }
        }
     }' \
    http://admin:password@localhost:8092/app_permissions/_design/permission_views

  curl -X PUT \
    -H "Accept:application/json" \
    -H "Content-Type: application/json" \
    -d '{
        "views": {
           "get_name": {
              "map": "function (doc, meta) {\n emit(doc.cloudlet, doc.username);\n}"
           }
        }
     }' \
    http://admin:password@localhost:8092/users/_design/user_views
