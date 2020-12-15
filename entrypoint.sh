#!/bin/sh -l

AWS_ACCESS_KEY_ID=$2 AWS_SECRET_ACCESS_KEY=$3 AWS_DEFAULT_REGION=$5 aws eks --region $5 update-kubeconfig --name it-production
chmod 600 /root/.kube/config

output=`helm $1`
echo "::set-output name=result::$output"
