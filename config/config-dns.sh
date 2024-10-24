#!/bin/bash

# Automatisation de la configuration DNS
echo "Configuration du serveur DNS pour 'monsiteweb.com'..."

# Créer un fichier de configuration pour la zone DNS
sudo bash -c 'cat > /etc/bind/named.conf.local <<EOF
zone "monsiteweb.com" {
    type master;
    file "/etc/bind/db.monsiteweb.com";
};
EOF'

# Créer un fichier de zone DNS pour monsiteweb.com
sudo bash -c 'cat > /etc/bind/db.monsiteweb.com <<EOF
;
; BIND data file for monsiteweb.com
;
\$TTL    604800
@       IN      SOA     ns.monsiteweb.com. root.monsiteweb.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns.monsiteweb.com.
@       IN      A       192.168.1.1
ns      IN      A       192.168.1.1
www     IN      A       192.168.1.1
EOF'

# Vérifier la configuration de Bind9
sudo named-checkconf
sudo named-checkzone monsiteweb.com /etc/bind/db.monsiteweb.com

# Redémarrer le service DNS
echo "Redémarrage du serveur DNS..."
sudo systemctl restart bind9

echo "Le serveur DNS a été configuré avec succès pour 'monsiteweb.com'!"
