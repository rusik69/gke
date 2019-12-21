#!/usr/bin/env bash
curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin
linkerd version
linkerd check --pre
linkerd install | kubectl apply -f -
linkerd check
kubectl apply -f ./linkerd-web-ingress.yaml