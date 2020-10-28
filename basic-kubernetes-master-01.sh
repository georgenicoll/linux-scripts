#!/bin/bash
echo "--> Initialising the control plane..."
sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

echo "--> Copy config"
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

