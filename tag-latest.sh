#!/bin/bash
source ./env
docker tag $IMAGE $IMAGE:latest;
docker push $IMAGE:latest
