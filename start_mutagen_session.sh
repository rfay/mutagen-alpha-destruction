#!/bin/bash -x

set -eu -o pipefail

mutagen daemon start
mutagen sync create $PWD docker://tester99/var --sync-mode=two-way-resolved --name=tester99