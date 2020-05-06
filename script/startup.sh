#!/bin/bash
export META_IP=$(curl -s http://169.254.170.2/v2/metadata | jq -r .Containers[0].Networks[0].IPv4Addresses[0])
java -jar /home/runtime/run.jar
