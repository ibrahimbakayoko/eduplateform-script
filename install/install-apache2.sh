#!/bin/bash

# Mise à jour des paquets et installation d'Apache2
echo "Mise à jour des paquets..."
sudo apt update

echo "Installation d'Apache2..."
sudo apt install -y apache2

# Activer et démarrer le service Apache2
echo "Activation et démarrage d'Apache2..."
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Apache2 a été installé avec succès !"
