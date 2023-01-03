#!/bin/sh

# Tutorial in https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/
## First create /etc/kubernetes/enc dir with minikube ssh, than
minikube cp ./enc.yaml /etc/kubernetes/enc/enc.yaml
# edit the api server pod manifest according to the tutorial
# to test out 
minikube cp ./hexdump /hexdump
minikube cp ./etcdctl /etcdctl

# execute:
# create a secret:
# kubectl create secret generic secret1 -n default --from-literal=mykey=mydata
# and retrieve its information from etcd
#sudo ETCDCTL_API=3 /etcdctl --cacert=/var/lib/minikube/certs/etcd/ca.crt --cert=/var/lib/minikube/certs/etcd/server.crt --key=/var/lib/minikube/certs/etcd/server.key get /registry/secrets/default/secret1

