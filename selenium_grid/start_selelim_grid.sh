#!/bin/bash
docker-machine start selenium
echo "Done, setting environment variables"
docker-machine env selenium
eval "$(docker-machine env selenium)"
echo "Done, starting selenium hub... wait"
docker run -d -P -p 4444:4444 --name selenium_hub selenium/hub
sleep 5
echo "Done, staring nodes... wait"
docker run -d --link selenium_hub:hub --name firefox1 selenium/node-firefox
docker run -d --link selenium_hub:hub --name firefox2 selenium/node-firefox
docker run -d --link selenium_hub:hub --name firefox3 selenium/node-firefox
docker run -d --link selenium_hub:hub --name firefox4 selenium/node-firefox
docker run -d --link selenium_hub:hub --name firefox5 selenium/node-firefox
echo "Done, selenium grid at:"
echo "http://$(docker-machine ip selenium):4444/wd/hub"
echo "Note: it may take a while for all nodes to connect."
