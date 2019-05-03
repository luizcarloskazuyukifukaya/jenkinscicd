#!/bin/bash

echo "Shuting down the CICD environment, which has been created by setup.sh"

PROJECT_ID=luiz-carlos-gcp
REGION=asia-northeast1
ZONE=asia-northeast1-a
JENKINS_VPC=jenkinsvpc
JENKINS_FW=jenkinsfw
JENKINS_CLUSTER=jenkinscluster

# authenticate
gcloud auth login
gcloud config set project $PROJECT_ID
gcloud config set compute/region $REGION
gcloud config set compute/zone $ZONE

# Delete the cluster
gcloud container clusters delete $JENKINS_CLUSTER

# Delete firewall rules
#gcloud compute firewall-rules list --filter=jenkins
#gcloud compute firewall-rules delete $JENKINS_FW

# Delete network
# NOTE: Firewall rules must be delete first, before deleting the VPC.
gcloud compute networks delete $JENKINS_VPC

# Delete image
gcloud compute images delete jenkins-home-image

# Delete disk volume
gcloud beta compute disks delete jenkins-home
#gcloud compute disks delete jenkins-home

echo "Completed!!!"

