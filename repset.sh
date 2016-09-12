#!/bin/bash
if ["$(docker network ls | grep mongo-net | wc -l)" -eq "0"];
then
	echo "creating docker network mongo-net"
	docker network create mongo-net
fi

echo "Build mongodb-replica-set image"
docker build -t "mongodb-replica-set" .
sleep 30
echo "Starting replica set"
docker-compose up -d
