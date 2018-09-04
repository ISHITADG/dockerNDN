DockerNDN: Run and compare NDN setup with other exisiting traffic on host using docker

# 1. SETUP DOCKER AND OVS/OPENVSWITCH 
Run dockerovs.sh

# 2. SETUP BRIDGE CONNECTIONS & CONFIGURE CONTAINERS FOR NDN AND IP TRAFFIC
Run dockerbridge.sh

# 3. BUILD & RUN THE DOCKER CONTAINERS
## NDN Container
Run ndndocker.sh
## IP Container 
Run ipdocker.sh 
## Test running containers
sudo docker ps
## To stop a container
sudo docker stop <docker-name>
For ex:- sudo docker stop ndn1

# 4. TEST INDIVIDUAL CONNECTIVITY
## At NDN container 
ping ndn container
## At IP container 
ping ip container

# 5. TEST BRIDGE SETUP BETWEEN CONTAINERS
## At each container
apt-get update; 
apt-get install iputils-ping

## at NDN Container 
ping "IP of IP Container"
  
## at IP Container 
ping "IP of NDN Container"
