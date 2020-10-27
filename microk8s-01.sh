#!/bin/sh
echo "--> Install microk8s"
sudo snap install microk8s --classic --channel=latest

echo "--> Setup groups"
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

echo "--> Waiting for microk8s to be ready"
sudo microk8s status --wait-ready

echo "--> Alias kubectl to 'microk8s kubectl'"
echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases

echo "--> Adding add-ons dns and storage"
sudo microk8s enable dns storage

echo "<-- Now move to clustering (re-login to pick up groups + alias)"

