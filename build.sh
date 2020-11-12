#!/bin/bash
set -xeuo pipefail
source ./env
#TAG=$VERSION-$(echo "$CIRCLE_SHA1" | head -c 7)
export DOCKER_BUILDKIT=1

if [ -n "${DEPLOY:-}" ]; then
    PUSH="--push"
    docker login --username="$DOCKER_USER" --password="$DOCKER_PASS"
else
    export BUILDX_NO_DEFAULT_LOAD=1
    PUSH=
fi

docker buildx create --use
# shellcheck disable=SC2086
docker buildx build \
    --platform "$PLATFORMS" \
    --build-arg ALPINE_VERSION=$ALPINE_VERSION \
    --build-arg PKG_VERSION=$PKG_VERSION \
    --build-arg VERSION=$VERSION \
    --tag "$REPO:${VERSION}" \
    --tag "$REPO:latest" \
    $PUSH \
    .
