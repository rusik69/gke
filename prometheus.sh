#!/usr/bin/env bash
kubectl create ns monitoring
kubectl label namespace monitoring istio-injection=enabled
git clone https://github.com/coreos/kube-prometheus.git
cd kube-prometheus
kubectl create -f manifests/
sleep 10
kubectl apply -f manifests/
sleep 10
kubectl -n monitoring get servicemonitor kubelet -o yaml | sed 's/https/http/' | kubectl replace -f -
