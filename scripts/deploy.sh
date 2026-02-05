#!/bin/bash
# Deploy Open edX on EKS
kubectl apply -f k8s/namespaces/namespace.yaml
kubectl apply -f k8s/pvc/
kubectl apply -f k8s/deployments/
kubectl apply -f k8s/ingress/
kubectl apply -f k8s/hpa/
echo "Open edX deployed. Access via CloudFront default domain."

