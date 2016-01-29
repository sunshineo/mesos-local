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

# Config and restart Zookeeper
HOSTNAME=$(hostname) # tms-mesos-001.iad.prod.zulily.com
HOSTNAME=$(echo $HOSTNAME | cut -d \. -f 1) # tms-mesos-001
HOSTNAME=$(echo $HOSTNAME | cut -d \- -f 3) # 001
HOSTNUMBER=$(echo $HOSTNAME | sed 's/^0*//g') # Remove leading 0s
echo $HOSTNUMBER | sudo tee /etc/zookeeper/conf/myid > /dev/null
echo -e "server.1=tms-mesos-001.iad.prod.zulily.com:2888:3888\nserver.2=tms-mesos-002.iad.prod.zulily.com:2888:3888\nserver.3=tms-mesos-003.iad.prod.zulily.com:2888:3888" | sudo tee --append /etc/zookeeper/conf/zoo.cfg > /dev/null
sudo service zookeeper restart

# Configure and restart Mesos
echo 'zk://tms-mesos-001.iad.prod.zulily.com:2181,tms-mesos-002.iad.prod.zulily.com:2181,tms-mesos-003.iad.prod.zulily.com:2181/mesos' | sudo tee /etc/mesos/zk > /dev/null
echo 2 | sudo tee /etc/mesos-master/quorum > /dev/null
sudo service mesos-slave stop
echo 'manual' | sudo tee /etc/init/mesos-slave.override > /dev/null
sudo service mesos-master restart


# Install dependencies for Marathon
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Install and restart Marathon
sudo apt-get -y install marathon
sudo service marathon restart
