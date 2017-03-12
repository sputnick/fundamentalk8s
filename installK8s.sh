#!/bin/bash
apt-get update && apt-get upgrade -y && apt-get install -y curl git
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# if trouble with docker installing/starting (will delete all docker stuff and data)
# cd /var/lib/docker
# ./nuke-graph-directory.sh /var/lib/docker
#delete network bridge
# apt remove docker.io

apt-get update && apt-get install -y docker.io kubelet kubeadm kubectl kubernetes-cni && systemctl disable ufw.service && systemctl enable docker.service
