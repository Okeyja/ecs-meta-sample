#!/bin/bash
TAG=312100619662.dkr.ecr.cn-north-1.amazonaws.com.cn/ecs-meta-sample:0.0.1
mvn package -D skipTests
docker build . -t  $TAG
docker push $TAG
