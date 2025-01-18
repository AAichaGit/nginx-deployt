#!/bin/bash

# Step 1: Create the argocd namespace
echo "Creating ArgoCD namespace..."
```kubectl create namespace argocd
```
# Step 2: Install ArgoCD
echo "Installing ArgoCD..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Step 3: Wait for ArgoCD to deploy
echo "Waiting for ArgoCD pods to be running..."
kubectl wait --for=condition=available --timeout=600s deployment/argocd-server -n argocd

# Step 4: Expose ArgoCD API server via port forwarding
echo "Port forwarding ArgoCD API server..."
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Step 5: Retrieve the initial admin password
echo "Retrieving the initial admin password..."
ARGOCD_PASSWORD=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d)

# Step 6: Output login information
echo "ArgoCD has been installed."
echo "You can access the ArgoCD UI at https://localhost:8080"
echo "Login using the following credentials:"
echo "Username: admin"
echo "Password: $ARGOCD_PASSWORD"

# Instructions for setting up the ArgoCD CLI (optional)
echo ""
echo "To set up the ArgoCD CLI, use the following command:"
echo "argocd login localhost:8080 --username admin --password $ARGOCD_PASSWORD"
