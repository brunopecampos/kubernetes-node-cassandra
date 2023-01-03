#!/bin/sh
# run with superuser


# 1. turn on nfs kernel modules
modprobe nfs
modprobe nfsd
# 2. launch the nfs-server container
docker run -d --rm --privileged --name nfs-server  -v /var/nfs:/var/nfs  phico/nfs-server:latest
# 3. Add the nfs-server container to the minikube docker network
docker network connect k8s-node-cassandra nfs-server 
# 4. 