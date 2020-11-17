#!/bin/bash
set -euo pipefail
source ./.env
docker run --rm --privileged docker/binfmt:latest --install "$PLATFORMS"
