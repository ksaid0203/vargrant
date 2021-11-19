#!/bin/bash

sudo kubeadm init --control-plane-endpoint 192.168.56.11 --pod-network-cidr 10.233.0.0/16 --apiserver-advertise-address 192.168.56.11 | tail -n 2

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

kubectl get nodes