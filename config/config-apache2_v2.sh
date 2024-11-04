#!/bin/bash

# Fonction pour créer un hôte virtuel
create_virtual_host() {
    echo "Configuration d'un hôte virtuel pour Apache2..."
    read -p "Veuillez entrer le nom du site (sans www) : " NOMSITE
    read -p "Veuillez entrer le numéro de port du site (par défaut 80) : " PORT
    PORT=${PORT:-80} # Définit 80 comme port par défaut si aucune valeur n'est entrée
    read -p "Veuillez entrer l'adresse IP du site (par défaut '*' pour toutes les interfaces) : " IPADDR
    IPADDR=${IPADDR:-*} # Définit '*' comme adresse IP par défaut si aucune valeur n'est entrée

    # Créer un répertoire pour le site web
    sudo mkdir -p /var/www/${NOMSITE}

    # Donner les droits appropriés
    sudo chown -R $USER:$USER /var/www/${NOMSITE}
    sudo chmod -R 755 /var/www/${NOMSITE}

    # Créer un fichier d'index pour tester
    echo "<html><h1>Ceci est un test du serveur Apache</h1></html>" > /var/www/${NOMSITE}/index.html

    # Créer un fichier de configuration pour l'hôte virtuel
    sudo tee /etc/apache2/sites-available/${NOMSITE}.conf > /dev/null <<-EOF
<VirtualHost ${IPADDR}:${PORT}>
    ServerAdmin admin@${NOMSITE}.com
    ServerName ${NOMSITE}.com
    ServerAlias www.${NOMSITE}.com
    DocumentRoot /var/www/${NOMSITE}
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/${NOMSITE}.crt
    SSLCertificateKeyFile /etc/ssl/private/${NOMSITE}.key
</VirtualHost>
EOF

    # Activer l'hôte virtuel et désactiver le site par défaut
    sudo a2ensite ${NOMSITE}.conf
    sudo a2dissite 000-default.conf

    # Générer un certificat SSL auto-signé
    echo "Génération d'un certificat SSL auto-signé pour ${NOMSITE}..."
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/${NOMSITE}.key \
        -out /etc/ssl/certs/${NOMSITE}.crt \
        -subj "/C=FR/ST=State/L=City/O=Organization/CN=${NOMSITE}.com"

    # Activer le module SSL d'Apache
    sudo a2enmod ssl

    # Redémarrer Apache2 pour appliquer les changements
    echo "Redémarrage d'Apache2..."
    sudo systemctl restart apache2

    echo "Apache2 a été configuré avec succès avec un hôte virtuel pour '${NOMSITE}.com' !"
}

# Boucle principale
while true; do
    create_virtual_host
    read -p "Voulez-vous créer un autre site ? (o/n) : " CONTINUE
    if [[ "$CONTINUE" =~ ^[nN]$ ]]; then
        echo "Au revoir !"
        break
    fi
done

