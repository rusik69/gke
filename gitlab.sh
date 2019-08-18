#!/usr/bin/env bash
helm install --name gitlab stable/gitlab-ce --timeout 600 --set externalUrl=http://gitlab.rusik.dev -f=./gitlab.yaml
kubectl apply -f ./gitlab-gateway.yaml

