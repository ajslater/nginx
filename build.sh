#!/bin/bash
set -euo pipefail
source ./env
#TAG=$VERSION-$(echo "$CIRCLE_SHA1" | head -c 7)

function build-platform {
  PLATFORM=$1
  docker build \
      --platform "$PLATFORM" \
      --file "Dockerfile.${PLATFORM}" \
      --build-arg ALPINE_VERSION=$ALPINE_VERSION \
      --build-arg PKG_VERSION=$PKG_VERSION \
      --tag "$IMAGE:${PLATFORM}-${VERSION}" \
      --tag "$IMAGE:${PLATFORM}-latest" \
      .
}

for PLATFORM in "${PLATFORMS[@]}"; do
  build-platform "$PLATFORM"
done
