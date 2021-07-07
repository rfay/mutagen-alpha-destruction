#!/bin/bash -x

docker rm -f tester99 || true
docker run --name=tester99 --rm -it --detach busybox tail -f /dev/null