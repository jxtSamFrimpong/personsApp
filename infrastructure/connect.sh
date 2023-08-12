#!/bin/sh

#gcloud auth activate-service-account ${SVC_EM} --key-file=${SVC_ACC}
gcloud container clusters get-credentials ${CLUSTER} --region ${REGION} --project ${PROJECT}