#!/bin/bash
# this script expects docker to have already been installed
echo "--> Prerequisites..."
sudo apt update
sudo apt install net-tools
echo "--> kubelet etc..."
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
#sudo apt-mark hold kubelet kubeadm kubectl
echo "--> Now set up the master or a minion"
