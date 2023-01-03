#!/bin/bash

minikube start -p k8s-node-cassandra -n 3
minikube profile k8s-node-cassandra
./nfs-storage/install_csi_driver.sh
sudo ./nfs-storage/run_nfs_server.sh
./ingress/ingress_install.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install --generate-name --values=./frontend/values.yaml bitnami/nginx
kubectl apply -f ./nfs-storage/nfs_sc.yaml
kubectl apply -f ./secrets/database_secrets.yaml
kubectl apply -f ./config_maps/
kubectl apply -f ./frontend/frontend_service.yaml
kubectl apply -f ./backend/backend_deploy.yaml
kubectl apply -f ./backend/backend_service.yaml
kubectl apply -f ./database/database_service.yaml
kubectl apply -f ./ingress/ingress.yaml
kubectl apply -f ./database/database_statefulset.yaml
# sudo echo "192.168.X.X" >> /etc/hosts