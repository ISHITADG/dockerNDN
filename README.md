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
## Detach & leave it running
Ctrl+P Ctrl+Q
## Rejoin
docker attach "container name"

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
## At All host machines
wget -L https://raw.githubusercontent.com/ISHITADG/NDN---in-parallel-SDN-and-NFV/master/1_ndn.sh  <br />
bash 1_ndn.sh   <br />
nfdc face create udp://173.16.1.3  <br />
nfdc route add /ndn udp://173.16.1.3  <br />
## NDNPING TEST
>ndnpingserver /ndn  <br />
>ndnping /ndn  <br />
## FILETRANSFER TEST 
At server:   <br />
>cp 1KB.txt /mnt/ndn <br />
>ndnputchunks -v ndn:/ndn < /mnt/ndn/1KB.txt  <br /> 
>ndnputchunks -p ndn:/ndn/%FD%00%00%01e%A4%A2g%E5 < /mnt/ndn/1KB.txt  <br />
At client:   <br />
>ndncatchunks -d fixed /ndn/%FD%00%00%01e%A4%A2g%E5

# 6. TEST IP FILE TRANSFER
At server: <br />
>sudo apt-get install apache2 <br /> 
>cp ~/100KB.txt /var/www/html/
>sudo chown -R $USER:$USER /var/www/
>sudo chmod -R 755 /var/www
>cd /etc/apache2/sites-available/
>sudo vim 000-default.conf
>sudo a2ensite 000-default.conf
>sudo service apache2 restart
At client:
>wget http://172.18.0.1/1KB.txt
