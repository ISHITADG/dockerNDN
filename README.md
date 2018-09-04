DockerNDN: Run and compare NDN setup with other exisiting traffic on host using docker

# 1. SETUP DOCKER AND OVS/OPENVSWITCH 
Run dockerovs.sh

# 2. SETUP BRIDGE CONNECTIONS & CONFIGURE CONTAINERS FOR NDN AND IP TRAFFIC
Run dockerbridge.sh

# 3. TEST BRIDGE SETUP BETWEEN CONTAINERS
## At each container
apt-get update; 
apt-get install iputils-ping

## at NDN Container 
ping "<IP of IP Container>"
  
## at IP Container 
ping "<IP of NDN Container>"
