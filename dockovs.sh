#!/bin/bash

##Install OVS
sudo apt-get update
sudo apt-get install openvswitch-switch

sudo ovs-vsctl --version
echo done

##install docker-ce
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo cd /usr/bin
sudo wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
sudo chmod a+rwx ovs-docker

##start ovs database
sudo /etc/init.d/openvswitch-switch start 

##create bridge and start it
sudo ovs-vsctl add-br ovs-br1
sudo ifconfig ovs-br1 173.16.1.1 netmask 255.255.255.0 up
sudo ovs-vsctl show
