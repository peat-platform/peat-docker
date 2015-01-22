#!/bin/sh

docker rm -f $(sudo docker ps -a | grep "openi" | awk "{print \$1}")
