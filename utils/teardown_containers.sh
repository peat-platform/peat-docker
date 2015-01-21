#!/bin/sh

docker stop $(docker ps -a -q | grep openi)
docker rm $(docker ps -a -q | grep openi)
