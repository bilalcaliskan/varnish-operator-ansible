#!/bin/bash

TAG=$1

make docker-build docker-push IMG=docker.io/bilalcaliskan/varnish-operator-ansible:$TAG
make install
export IMG=bilalcaliskan/varnish-operator-ansible:$TAG
make deploy

kubectl delete -f config/samples/cache_v1_varnish.yaml
kubectl create -f config/samples/cache_v1_varnish.yaml
