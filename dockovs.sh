#!/bin/bash

##Install OVS
sudo apt-get update
sudo apt-get install -y openvswitch-switch

sudo ovs-vsctl --version

##install docker-ce
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt-get update
sudo apt-get install -y docker-ce
cd /usr/bin
sudo rm ovs-docker
sudo wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
sudo chmod a+rwx ovs-docker

##start ovs database
sudo /etc/init.d/openvswitch-switch start 

echo done
