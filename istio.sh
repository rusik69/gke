#!/usr/bin/env bash
set -x
kubectl label namespace default istio-injection=enabled

