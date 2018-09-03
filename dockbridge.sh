#!/bin/bash

## create bridge
sudo ovs-vsctl add-br ovs-br1
sudo ifconfig ovs-br1 173.16.1.1 netmask 255.255.255.0 up
sudo ovs-vsctl show

##configure this bridge with some container - in our case NDN Docker and IP Docker
#configuring NDN Docker
sudo docker run -t -i --name container1 ubuntu /bin/bash
#configuring IP Docker
sudo docker run -t -i --name container2 ubuntu /bin/bash
#connect the above containers to the OVS bridge ovs-br1
sudo ovs-docker add-port ovs-br1 eth1 container1 --ipaddress=173.16.1.2/24
sudo ovs-docker add-port ovs-br1 eth1 container2 --ipaddress=173.16.1.3/24

##adding extra bridges- eth1 
#sudo ovs-vsctl add-port ovs-br1 eth1
