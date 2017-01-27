echo "Stopping all containers"
docker stop $(docker ps -a -q)

echo "Removing all containers"
docker rm $(docker ps -a -q)

echo "Removing dangling images"
docker rmi $(docker images -f dangling=true -q)
