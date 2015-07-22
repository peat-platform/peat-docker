#!/bin/sh

docker rmi -f $(docker images | grep "peatplatform/" | awk "{print \$3}")
