#!/bin/bash

# Mise à jour des paquets et installation de Bind9 (DNS)
echo "Mise à jour des paquets..."
sudo apt update

echo "Installation de Bind9..."
sudo apt install -y bind9

# Activer et démarrer le service DNS
echo "Activation et démarrage de Bind9..."
sudo systemctl enable bind9
sudo systemctl start bind9

echo "Bind9 (DNS) a été installé avec succès !"
