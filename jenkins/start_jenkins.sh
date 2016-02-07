#!/bin/bash
docker-machine start jenkins
echo "Done, setting environment variables"
docker-machine env jenkins
eval "$(docker-machine env jenkins)"
docker run -d -P -p 8080:8080 -p 50000:50000 --name jenkins jenkins

