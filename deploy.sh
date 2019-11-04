#!/usr/bin/env bash
set -e
set -x
./gke_cluster.sh
./helm.sh
#./istio.sh
#./gitlab.sh
./prometheus.sh
