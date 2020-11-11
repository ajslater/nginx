#!/bin/bash
set -xeuo pipefail
# shellcheck source=../env
source ./env

function save-image {
    PLATFORM=$1
    OUTPUT="images/${PLATFORM}_image.tar"
    IMAGE_TAG="${IMAGE}:${PLATFORM}-latest"
    docker save --output "$OUTPUT" "$IMAGE_TAG"
}

mkdir -p images

for PLATFORM in "${PLATFORMS[@]}"; do
    save-image "$PLATFORM"
done;
