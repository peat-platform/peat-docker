#!/bin/bash

function download_version ()
{
	echo "Downloading OPENi $1"
	sudo docker pull openiicteu/dao:"$1"
	sudo docker pull openiicteu/dao_proxy:"$1"
	sudo docker pull openiicteu/authapi:"$1"         
	sudo docker pull openiicteu/typeapi:"$1"         
	sudo docker pull openiicteu/redirect:"$1"        
	sudo docker pull openiicteu/mongrel2:"$1"        
	sudo docker pull openiicteu/couchbase:"$1"      
	sudo docker pull openiicteu/searchapi:"$1"       
	sudo docker pull openiicteu/objectapi:"$1"    
	sudo docker pull openiicteu/swaggerdef:"$1"      
	sudo docker pull openiicteu/cloudletapi:"$1"  
	sudo docker pull openiicteu/auth-dialogs:"$1"   
	sudo docker pull openiicteu/elasticsearch:"$1"   
	sudo docker pull openiicteu/notifications:"$1"  
	sudo docker pull openiicteu/attachmentapi:"$1"  
	sudo docker pull openiicteu/permissionsapi:"$1" 
	sudo docker pull openiicteu/httpswaggerdef:"$1"
	sudo docker pull openiicteu/admin-dashboard:"$1"
	sudo docker pull openiicteu/user-dashboard:"$1"
}

function list_args
{
	echo "No arguments supplied"
	echo "#####################"
	echo "    Command List     "
	echo "#####################"
	echo "1) <VERSION_NUMBER>"
    echo "   Downloads version of OPENi docker"
    echo "2) 'list'"
    echo "   Lists all versions of OPENi docker"
}

function list_versions
{
	echo "latest"
	echo "0.5.0"
}

function parse_input ()
{
	if [ "$1" == "list" ]; then
	   list_versions
    else
	   download_version $1
    fi
}

if [ -z "$1" ]; then
	list_args
else
	parse_input $1
fi




