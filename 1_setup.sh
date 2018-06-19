#!/bin/bash

##install docker on Router first 
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce

##Install Ovs-docker utility
sudo apt-get install openvswitch-switch
cd /usr/bin
sudo wget -L https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
sudo chmod a+rwx ovs-docker

##Create an ovs bridge: Here we will be adding a new OVS bridge and configuring it, 
#so that we can get the containers connected on the different network.
sudo ovs-vsctl add-br ovs-br1
sudo ifconfig ovs-br1 173.16.1.1 netmask 255.255.255.0 up

##Add a port from OVS bridge to the Docker Container
#create containers
sudo docker run -t -i --name container2 ubuntu /bin/bash
sudo docker run -t -i --name container2 ubuntu /bin/bash
#connect them to ovs-bridge
sudo ovs-docker add-port ovs-br1 eth1 container1 --ipaddress=173.16.1.2/24
sudo ovs-docker add-port ovs-br1 eth1 container2 --ipaddress=173.16.1.3/24
#Test the connection between two containers connected via OVS bridge using Ping command

echo done
