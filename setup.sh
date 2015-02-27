#!/bin/sh

source ./conf

# Make sure output paths exist
setup_paths()
{
   mkdir -p $OUTPUT_PATH
   mkdir -p $CB_OUTPUT_PATH
}

setup_paths

# Install Docker
apt-get -y update
apt-get -y install curl sudo bash
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Install OPENi Docker
sudo bash utils/build_all.sh
sudo bash utils/run_all.sh