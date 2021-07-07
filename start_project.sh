#!/bin/bash -x

docker rm -f tester99 || true
# Mount PWD into /var, which doesn't have much useful on busybox, just spool and www
docker run --name=tester99 --rm -it -v $PWD:/var busybox sh