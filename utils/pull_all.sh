#!/bin/bash

function download_version ()
{
	echo "Downloading PEAT $1"
	sudo docker pull peatplatform/dao:"$1"
	sudo docker pull peatplatform/dao_proxy:"$1"
	sudo docker pull peatplatform/authapi:"$1"         
	sudo docker pull peatplatform/typeapi:"$1"         
	sudo docker pull peatplatform/redirect:"$1"        
	sudo docker pull peatplatform/mongrel2:"$1"        
	sudo docker pull peatplatform/couchbase:"$1"      
	sudo docker pull peatplatform/searchapi:"$1"       
	sudo docker pull peatplatform/objectapi:"$1"    
	sudo docker pull peatplatform/swaggerdef:"$1"      
	sudo docker pull peaticteu/cloudletapi:"$1"  
	sudo docker pull peatplatform/auth-dialogs:"$1"   
	sudo docker pull peatplatform/elasticsearch:"$1"   
	sudo docker pull peatplatform/notifications:"$1"  
	sudo docker pull peatplatform/attachmentapi:"$1"  
	sudo docker pull peatplatform/permissionsapi:"$1" 
	sudo docker pull peatplatform/httpswaggerdef:"$1"
	sudo docker pull peatplatform/admin-dashboard:"$1"
	sudo docker pull peatplatform/user-dashboard:"$1"
}

function list_args
{
	echo "No arguments supplied"
	echo "#####################"
	echo "    Command List     "
	echo "#####################"
	echo "1) <VERSION_NUMBER>"
    echo "   Downloads version of PEAT docker"
    echo "2) 'list'"
    echo "   Lists all versions of PEAT docker"
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




