#!/usr/bin/env bash
set -e
set -x
./helm.sh
./istio.sh
./gitlab.sh