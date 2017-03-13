#!/bin/bash
#kubeadm reset
kubeadm init
sudo systemctl enable kubelet.service

kubectl apply -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
kubectl apply -f https://git.io/weave-kube

