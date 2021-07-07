#!/bin/bash -x

set -eu -o pipefail

docker rm -f tester99 2>/dev/null || true
docker run --name=tester99 --rm -it --detach busybox sh -c "touch /var/www/junk.txt /var/spool/junk2.txt && tail -f /dev/null"