#!/bin/bash
set -euxo pipefail
source ./.env
docker run --rm --privileged tonistiigi/binfmt:latest --install "$PLATFORMS"
