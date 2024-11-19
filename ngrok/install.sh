#!/bin/bash

NAMESPACE=ngrok-operator

echo "Enabling ngrok-operator in {$NAMESPACE} namespace"

helm repo update ngrok || helm repo add ngrok https://charts.ngrok.com/ngrok-opeartor

helm upgrade --install --create-namespace ngrok-opeartor ngrok/ngrok-operator --namespace "${NAMESPACE}" --set oneClickDemoMode=true
