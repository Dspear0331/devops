basic commands 
# Runs docker 
docker run <container_name or container_id>
#stop running containers
docker stop <container_name or container_id>
# running containers
docker ps
# display container running or not
docker ps -a 

# remove stopped container 
docker rm <container_name or container_id>
#verify
docker ps 

#view docker images 
docker image
#remove images all dependent dockers must be stopped
docker rmi <image_name or image_id>

pulls 
docker pull ubuntu 

run a command in a container
docker exec -it <container_name> /bin/bash

#a docker can be put to sleep 
docker run <container> sleep <secs>                   

***********************************************************************************

The Nautilus DevOps team is conducting application deployment tests on selected application servers. They require a nginx container deployment on Application Server 1. Complete the task with the following instructions:

    On Application Server 1 create a container named nginx_1 using the nginx image with the alpine tag. Ensure container is in a running state.

docker run  -d --name nginx_2 nginx:apline
docker ps

*************************************************************************************

The Nautilus DevOps team possesses confidential data on App Server 2 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.
Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /home/. Ensure the file is not modified during this operation.
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home/




****************************************************************************************
Nautilus project developers are planning to start testing on a new project. As per their meeting with the DevOps team, they want to test containerized environment application features. As per details shared with DevOps team, we need to accomplish the following task:

a. Pull busybox:musl image on App Server 2 in Stratos DC and re-tag (create new tag) this image as busybox:news.

docker pull busybox:musl && docker tag busybox:musl busybox:news
docker images
