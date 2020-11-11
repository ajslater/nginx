#!/bin/bash
set -euo pipefail
# shellcheck source=../env
source ./env
docker login --username="$DOCKER_USER" --password="$DOCKER_PASS"
docker push $IMAGE
