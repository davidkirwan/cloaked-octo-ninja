# Administration functions for managing docker containers

deploy: clean
	# Deploy the docker instances
	# Dependencies: clean
	echo "deploying ..."

clean:
	# Make sure exited containers are deleted
	# '-' prepended args continue on fail
	-docker rm -v $$(docker ps -a -q -f status=exited)

	# Remove unwanted dangling images
	-docker rmi $$(docker images -f "dangling=true" -q)

	# Remove unwanted volumes
	-docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
