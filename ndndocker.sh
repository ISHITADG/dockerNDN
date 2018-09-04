#!/bin/bash

#download NDN Dockerfile 
wget -L https://raw.githubusercontent.com/ISHITADG/dockerNDN/master/Dockerfile?token=AKYyYp0eCb26g9Eu9X9bjYK2rJ7oRcpuks5bl2ppwA%3D%3D
mv Dockerfile?token=AKYyYp0eCb26g9Eu9X9bjYK2rJ7oRcpuks5bl2ppwA%3D%3D Dockerfile

#build docker ndn docker type
docker build -t ndndock --build-arg VERSION_CXX=ndn-cxx-0.6.1 --build-arg VERSION_NFD=NFD-0.6.1 .

#Run NDN docker
docker run -d --rm --name ndn1 -p 6364:6363 -p 6365:6363/udp ndndock
