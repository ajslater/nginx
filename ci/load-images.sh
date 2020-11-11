#!/bin/bash
set -euo pipefail
for tarfn in images/*.tar; do
    docker load --input "$tarfn"
done;
