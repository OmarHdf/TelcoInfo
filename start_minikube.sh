#!/bin/bash

# Vérifier si minikube est déjà en cours d'exécution
if ! minikube status | grep -q "Running"; then
    echo "Minikube n'est pas en cours d'exécution. Démarrage..."
    minikube start --driver=docker
else
    echo "Minikube est déjà en cours d'exécution."
fi

# Configurer kubectl pour minikube
kubectl config use-context minikube

