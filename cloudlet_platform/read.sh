#echo $( cat conf.json | JSON.sh -p | egrep '\["dao"*"\]' | sed -e 's/\[\"dao\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["swagger_def_https"*"\]' | sed -e 's/\[\"swagger_def_https\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["swagger_def_http"*"\]' | sed -e 's/\[\"swagger_def_http\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["type_api"*"\]' | sed -e 's/\[\"type_api\"\]//g')


echo $( cat conf.json | JSON.sh -p | egrep '\["object_api"*"\]' | sed -e 's/\[\"object_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["cloudlet_api"*"\]' | sed -e 's/\[\"cloudlet_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["attachments_api"*"\]' | sed -e 's/\[\"attachments_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["search_api"*"\]' | sed -e 's/\[\"search_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["permissions_api"*"\]' | sed -e 's/\[\"permissions_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["notifications"*"\]' | sed -e 's/\[\"notifications\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["auth_api"*"\]' | sed -e 's/\[\"auth_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["crud_api"*"\]' | sed -e 's/\[\"crud_api\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["openi_rrd"*"\]' | sed -e 's/\[\"openi_rrd\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["https_redirect"*"\]' | sed -e 's/\[\"https_redirect\"\]//g')


#echo $( cat conf.json | JSON.sh -p | egrep '\["openi_aggregator"*"\]' | sed -e 's/\[\"openi_aggregator\"\]//g')