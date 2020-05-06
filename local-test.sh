#!/bin/bash
TAG=ecs-meta-sample:0.0.1
mvn package -D skipTests
docker build . -t  $TAG
docker run -p 8080:8080 -d $TAG > test-container-id.txt
