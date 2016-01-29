#!/bin/bash

# Config source repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update

# Install Mesos. Zookeeper installed as dependency.
# Install Zookeeper along did not work for me for some reason.
sudo apt-get -y install mesos

echo "manual" | sudo tee /etc/init/zookeeper.override
sudo service zookeeper stop

echo "manual" | sudo tee /etc/init/mesos-master.override
sudo service mesos-master stop

echo 'tms-mesos-001.iad.prod.zulily.com:5050,tms-mesos-002.iad.prod.zulily.com:5050,tms-mesos-003.iad.prod.zulily.com:5050' | sudo tee /etc/mesos/zk > /dev/null
sudo service mesos-slave restart