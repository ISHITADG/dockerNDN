DockerNDN: Run and compare NDN setup with other exisiting traffic on host using docker

# 1. SETUP DOCKER AND OVS/OPENVSWITCH 
Run dockerovs.sh

# 2. BUILD & RUN THE DOCKER CONTAINERS
## NDN Container
Run ndndocker.sh <br />
docker ps <br />
docker exec -it "ndn-container-id" bash <br />
check nfd-status inside the container 
>nfd-status 
## IP Container 
Run ipdocker.sh 
## Test running containers
sudo docker ps
## To stop a container
sudo docker stop "docker-name" <br />
For ex:- sudo docker stop ndn1

# 3. SETUP BRIDGE CONNECTIONS & CONFIGURE CONTAINERS FOR NDN AND IP TRAFFIC
## Connect the containers to OVS bridge
Run dockerbridge.sh

# 4. TEST INDIVIDUAL CONNECTIVITY
## At NDN container
apt-get update; <br />
apt-get install iputils-ping <br />
apt-get install net-tools <br />
apt-get install iproute2

## At NDN container 
ping "IP of IP container as defined in dockerbridge"
## At IP container 
ping "IP of NDN container as defined in dockerbridge"

# 5. TEST NDNPING & NDN-FILE TRANSFER

# 6. TEST IP FILE TRANSFER
