#!/usr/bin/env bash
set -x
docker build . -t loqutus/katsanddogs:0.0.1
docker push loqutus/katsanddogs:0.0.1