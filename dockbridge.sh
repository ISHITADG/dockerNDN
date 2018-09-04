#!/bin/bash

## create bridge
sudo ovs-vsctl add-br ovs-br1
sudo ifconfig ovs-br1 173.16.1.1 netmask 255.255.255.0 up
sudo ovs-vsctl show

##configure this bridge with some container - in our case NDN Docker and IP Docker
#connect the given containers to the OVS bridge ovs-br1
sudo ovs-docker add-port ovs-br1 eth1 ip1 --ipaddress=173.16.1.2/24
sudo ovs-docker add-port ovs-br1 eth1 ndn1 --ipaddress=173.16.1.3/24

##adding extra bridges- eth1 
#sudo ovs-vsctl add-port ovs-br1 eth1
