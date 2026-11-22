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
#clean up all stopped containers networks not used by at least one container all dangling images and unused build cache
docker system prune
select yes

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


**************************************************************************************
docker commmit <containter_name or container_id> <custom:name i.e nginx:v1>

One of the Nautilus developer was working to test new changes on a container. He wants to keep a backup of his changes to the container. A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:

a. Create an image games:devops on Application Server 1 from a container ubuntu_latest that is running on same server.


docker commit ubuntu_latest games:devops
docker images

*****************************************************************************************

One of the Nautilus DevOps team members was working to configure services on a kkloud container that is running on App Server 2 in Stratos Datacenter. Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:

a. Install apache2 in kkloud container using apt that is running on App Server 2 in Stratos Datacenter.

b. Configure Apache to listen on port 8086 instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on localhost, 127.0.0.1, container ip, etc.

c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.
