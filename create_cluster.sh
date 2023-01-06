#!/bin/bash

minikube start -p k8s-node-cassandra -n 3 --cni=cilium --memory=4096
minikube profile k8s-node-cassandra
./nfs-storage/install_csi_driver.sh
sudo ./nfs-storage/run_nfs_server.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install --generate-name --values=./frontend/values.yaml bitnami/nginx
kubectl apply -f ./nfs-storage/nfs_sc.yaml
kubectl apply -f ./secrets/database_secrets.yaml
kubectl apply -f ./config_maps/
kubectl apply -f ./frontend/frontend_service.yaml
kubectl apply -f ./backend/backend_deploy.yaml
kubectl apply -f ./backend/backend_service.yaml
kubectl apply -f ./database/database_service.yaml
kubectl apply -f ./database/database_statefulset.yaml
minikube addons enable metrics-server
#./ingress/ingress_install.sh
#kubectl apply -f ./ingress/ingress.yaml
# sudo echo "192.168.X.X" >> /etc/hosts