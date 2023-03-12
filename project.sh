#!/bin/bash
yum -y update
yum -y install epel-release
yum install -y python3

yum -y install git
sudo yum -y install docker
sudo yum -y install docker-compose
git clone https://github.com/HubertTruong/siteweb.git
sudo service docker restart
cd siteweb/
sudo yum -y install mailx 
sudo chmod +x start.sh
sudo ./start.sh

if [ $1 == "master" ]
then
  # install ansible
  curl -sS https://bootstrap.pypa.io/pip/3.6/get-pip.py | sudo python3
  /usr/local/bin/pip3 install ansible
  yum install -y sshpass
fi