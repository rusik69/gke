#!/usr/bin/env bash
set -x
echo "install helm"
# installs helm with bash commands for easier command line integration
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# add a service account within a namespace to segregate tiller
helm init
sleep 5
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# updates the repos for Helm repo integration
helm repo update
echo "verify helm"
# verify that helm is installed in the cluster
kubectl get deploy,svc tiller-deploy -n kube-system
