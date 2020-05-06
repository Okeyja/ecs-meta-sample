#!/bin/bash
container_id=$(cat test-container-id.txt)

docker stop ${container_id}
docker rm ${container_id}

rm -rf test-container-id.txt
docker rmi ecs-meta-sample:0.0.1
