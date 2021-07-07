#!/bin/bash -x

mutagen daemon start
mutagen sync create $PWD docker://tester99/var --sync-mode=two-way-resolved --name=tester99