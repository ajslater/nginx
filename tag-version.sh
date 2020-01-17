#!/bin/bash
source ./env
VERSION=${ALPINE_VERSION}_${PKG_VERSION}
TAG=$VERSION-$(echo $CIRCLE_SHA1 | head -c 7);
docker tag $IMAGE $IMAGE:$TAG;
docker push $IMAGE:$TAG;
