#!/usr/bin/env bash
set -x
set -e

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.4 sh -
export PATH="$PATH:./istio-1.2.4/bin"
kubectl create ns istio-system || true
kubectl apply -f kiali-secret.yaml -n istio-system
kubectl label namespace default istio-injection=enabled || true
helm install istio-1.2.4/install/kubernetes/helm/istio-init --name istio-init --namespace istio-system || true
sleep 60
kubectl create -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml || true
helm install istio-1.2.4/install/kubernetes/helm/istio --name=istio --namespace=istio-system --set gateways.enabled=true --set gateways.istio-ingressgateway.enabled=true --set grafana.enabled=true --set grafana.persist=true --set certmanager.enabled=true --set kiali.enabled=true --set grafana.accessMode=ReadWriteOnce
kubectl apply -f kiali-gateway.yaml -n istio-system
sleep 60