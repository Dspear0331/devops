basic commands 
# Runs docker 
docker run <container_name or container_id>
#stop running containers
docker stop <container_name or container_id>
# running containers
docker ps
# display container running or not
docker ps -a 

# remove container stopped container
docker rm <container_name or container_id>
#verify
docker ps 

#view docker images 
docker image
#remove images all dependent dockers must be stoped
docker rmi <image_name or image_id>

pulls 
docker pull ubuntu 

run a command in a container
docker exec -it <container_name> /bin/bash
