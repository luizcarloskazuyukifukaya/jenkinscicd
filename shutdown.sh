#!/bin/bash

echo "Shuting down the CICD environment, which has been created by setup.sh"

PROJECT_ID=luiz-carlos-gcp
REGION=asia-northeast1
ZONE=asia-northeast1-a
JENKINS_VPC=jenkinsvpc
JENKINS_FW=jenkinsfw
JENKINS_CLUSTER=jenkinscluster

# Delete the cluster
gcloud container clusters delete $JENKINS_CLUSTER

# Delete network
gcloud compute firewall-rules delete $JENKINS_FW

# Delete firewall rule
gcloud compute networks delete $JENKINS_VPC

echo "Completed!!!"

