#!/usr/bin/env bash
set -x
gcloud container clusters get-credentials katsanddogs-prod --zone europe-west1-b
echo "install helm"
# installs helm with bash commands for easier command line integration
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# add a service account within a namespace to segregate tiller
helm init
sleep 5
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# updates the repos for Helm repo integration
helm repo update
