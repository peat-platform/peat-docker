#!/bin/sh

docker rm -f $(docker ps -a | grep "openi" | awk "{print \$1}")
