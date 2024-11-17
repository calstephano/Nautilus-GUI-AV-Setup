#!/bin/bash

# User-configurable variables
POD_NAME="INITIALS-desktop"
CACHE_PVC_NAME="INITIALS-cache"
STORAGE_PVC_NAME="INITIALS-storage"
SECRET_NAME="INITIALS-secret"
PASSWORD_NAME="INITIALS-password"
PASSWORD="1234"

# Check if the pod exists and delete if it does
if kubectl get pod/$POD_NAME &>/dev/null; then
  echo "Pod '$POD_NAME' already exists, resetting..."
  kubectl delete pod/$POD_NAME
fi

# Check if PVC exists and create if not
if ! kubectl get pvc $CACHE_PVC_NAME &>/dev/null; then
  kubectl create -f xgl-cache.yaml
else
  echo "Persistent Volume Claim '$CACHE_PVC_NAME' already exists, skipping creation."
fi

if ! kubectl get pvc $STORAGE_PVC_NAME &>/dev/null; then
  kubectl create -f rook-storage.yaml
else
  echo "Persistent Volume Claim '$STORAGE_PVC_NAME' already exists, skipping creation."
fi

# Check if the secret exists and create if not
if ! kubectl get secret $SECRET_NAME &>/dev/null; then
  echo "Creating secret '$SECRET_NAME' with the provided password..."
  kubectl create secret generic $SECRET_NAME --from-literal=$PASSWORD_NAME=$PASSWORD
else
  echo "Secret '$SECRET_NAME' already exists, skipping creation."
fi

# Create the pod
kubectl create -f xgl.yaml

# Forward the port
if kubectl port-forward pod/$POD_NAME 8080:8080 &>/dev/null; then
  echo "Port forwarding successful! Access the GUI at http://127.0.0.1:8080"
else
  echo "Unable to forward the port. Please wait a moment and then run the following command manually:"
  echo "kubectl port-forward pod/$POD_NAME 8080:8080"
  echo "When successful, access the GUI at http://127.0.0.1:8080"
fi
