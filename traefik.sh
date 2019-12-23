#!/usr/bin/env bash
set -x
set -e
kubectl apply -f traefik/01-rbac.yaml
kubectl apply -f traefik/02-ingressroute.yaml
kubectl apply -f traefik/03-services.yaml
kubectl apply -f traefik/04-deployments.yaml
sleep 5
sudo setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/kubectl
kubectl port-forward --address 0.0.0.0 service/traefik 8000:8000 8080:8080 443:4443 -n default &
sleep 10
kubectl apply -f traefik/05-ingressroutes.yaml
curl https://rusik.dev/tls
kill $!