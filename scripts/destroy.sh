#!/bin/bash
kubectl delete -f k8s/ingress/
kubectl delete -f k8s/hpa/
kubectl delete -f k8s/deployments/
kubectl delete -f k8s/pvc/
kubectl delete -f k8s/namespaces/namespace.yaml
echo "Open edX resources destroyed."

