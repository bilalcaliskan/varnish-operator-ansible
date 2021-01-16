#!/bin/bash

TAG=$1

make docker-build docker-push IMG=docker.io/bilalcaliskan/varnish-operator-ansible:$TAG
make install
export IMG=bilalcaliskan/varnish-operator-ansible:$TAG
make deploy

kubectl delete varnishes.cache.example.com varnish-sample
kubectl create -f config/samples/cache_v1_varnish.yaml
