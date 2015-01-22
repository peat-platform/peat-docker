#!/bin/sh

docker rmi -f $(sudo docker images | grep "openiicteu/" | awk "{print \$3}")
