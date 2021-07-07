#!/bin/bash -x

set -eu -o pipefail

docker rm -f tester99 2>/dev/null || true
docker run --name=tester99 --rm -it --detach busybox tail -f /dev/null