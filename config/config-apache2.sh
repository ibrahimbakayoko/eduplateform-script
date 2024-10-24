#!/bin/bash

# Automatisation de la configuration d'Apache2
echo "Configuration d'un hôte virtuel pour Apache2..."

# Créer un répertoire pour le site web
sudo mkdir -p /var/www/monsiteweb

# Donner les droits appropriés
sudo chown -R $USER:$USER /var/www/monsiteweb
sudo chmod -R 755 /var/www/monsiteweb

# Créer un fichier d'index pour tester
echo "<html><h1>Ceci est un test du serveur Apache</h1></html>" > /var/www/monsiteweb/index.html

# Créer un fichier de configuration pour l'hôte virtuel
sudo bash -c 'cat > /etc/apache2/sites-available/monsiteweb.conf <<EOF
<VirtualHost *:80>
    ServerAdmin admin@monsiteweb.com
    ServerName monsiteweb.com
    ServerAlias www.monsiteweb.com
    DocumentRoot /var/www/monsiteweb
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF'

# Activer l'hôte virtuel et désactiver le site par défaut
sudo a2ensite monsiteweb.conf
sudo a2dissite 000-default.conf

# Redémarrer Apache2 pour appliquer les changements
echo "Redémarrage d'Apache2..."
sudo systemctl restart apache2

echo "Apache2 a été configuré avec succès avec un hôte virtuel pour 'monsiteweb.com'!"
