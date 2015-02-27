#!/bin/sh

source conf

# Install Docker
apt-get -y update
apt-get -y install curl sudo bash
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Install OPENi Docker
sudo bash utils/build_all.sh
sudo bash utils/run_all.sh