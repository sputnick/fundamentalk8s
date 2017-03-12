#!/bin/bash
#kubeadm reset
kubeadm init
kubectl apply -f https://git.io/weave-kube  --kubeconfig /etc/kubernetes/admin.conf
sudo systemctl enable kubelet.service
