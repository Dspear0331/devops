basic commands 
# Runs docker 
docker run <container_name or container_id>
#stop running containers
docker stop <container_name or container_id>
# running containers
docker ps
# display container running or not
docker ps -a 

# remove container 
docker rm <container_name or container_id>
#verify
docker ps 

#view docker images 
docker image
#remove immages must be stoped
docker rmi <image_name or image_id>

pulls 
docker pull ubuntu
