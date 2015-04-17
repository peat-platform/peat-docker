#!/bin/sh

docker rmi -f $(docker images | grep "openiicteu/" | awk "{print \$3}")
