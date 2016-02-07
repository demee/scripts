#!/bin/bash

eval "$(docker-machine env selenium)"
echo "Stopping nodes and hub"
docker stop firefox1
docker wait firefox1
docker stop firefox2
docker wait firefox2
docker stop firefox3
docker wait firefox3
docker stop firefox4
docker wait firefox4
docker stop firefox5
docker wait firefox5
docker stop selenium_hub
docker wait selenium_hub
echo "Cleaning up nodes"
sleep 1
docker rm selenium_hub
docker rm firefox1
docker rm firefox2
docker rm firefox3
docker rm firefox4
docker rm firefox5
echo "Stopping docker machine.... wait."
docker-machine stop selenium
echo "Selenium grid down."
