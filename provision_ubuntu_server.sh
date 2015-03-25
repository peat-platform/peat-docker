#!/bin/sh

source ./conf

mkdir -p $OUTPUT_PATH
mkdir -p $CB_OUTPUT_PATH

echo "ubuntu:$PASS"

echo "ubuntu:$PASS" | sudo chpasswd

sudo sed -i -e 's/ubuntu ALL=(ALL) NOPASSWD:ALL/ubuntu ALL=(ALL:ALL) ALL/g' /etc/sudoers.d/90-cloud-init-users

sudo apt-get update -q

sudo apt-get install -y git curl sudo bash

curl -sSL https://get.docker.com/ubuntu/ | sudo sh

sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker

sudo apt-get install ufw
sudo ufw disable
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow out to any port 25
sudo ufw allow out to any port 53
sudo ufw allow out to any port 80
sudo ufw allow out to any port 443
sudo ufw allow out to any port 9418
sudo ufw enable

echo y | sudo ufw enable

sudo apt-get install -y fail2ban

sudo apt-get install -y logwatch

sudo sed -i -e 's/\/usr\/sbin\/logwatch --output mail/\/usr\/sbin\/logwatch --output mail --mailto $LOGWATCH_EMAIL --detail high/g' /etc/cron.daily/00logwatch


source ~/.bashrc
