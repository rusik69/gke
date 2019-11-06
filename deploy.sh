#!/usr/bin/env bash
set -e
set -x

cd terraform
terraform init
terraform apply
gcloud container clusters get-credentials katsanddogs-prod --zone europe-west1-b --project decent-tracer-255319
./helm.sh
#./istio.sh
#./gitlab.sh
./prometheus.sh
