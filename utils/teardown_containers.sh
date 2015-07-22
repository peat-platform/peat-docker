#!/bin/sh

docker rm -f $(docker ps -a | grep "peat" | awk "{print \$1}")
