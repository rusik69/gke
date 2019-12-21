#!/usr/bin/env bash
set -e
set -x

cd terraform
terraform init
terraform apply
cd ..
gcloud container clusters get-credentials katsanddogs-prod --zone europe-west1-b --project decent-tracer-255319
./helm.sh
./traefik.sh
./linkerd.sh
./jaeger.sh