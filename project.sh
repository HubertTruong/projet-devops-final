#!/bin/bash
yum -y update
yum -y install epel-release
yum install -y python3

yum -y install git
sudo yum -y install docker
sudo yum -y install docker-compose
git clone https://github.com/HubertTruong/devops2.git
sudo service docker restart
cd devops2/
sudo docker-compose up

if [ $1 == "master" ]
then
  # install ansible
  curl -sS https://bootstrap.pypa.io/pip/3.6/get-pip.py | sudo python3
  /usr/local/bin/pip3 install ansible
  yum install -y sshpass
fi
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"