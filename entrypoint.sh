#!/bin/sh -l
aws eks update-kubeconfig --name $CLUSTER_ID
chmod 600 /root/.kube/config

output=`helm $1`
echo "::set-output name=result::$output"
