#!/bin/bash

#-------------------------------------------// FONCTIONS DE VALIDATION //--------------------------------------------
# Validation d'une adresse IP
function validate_ip() {
    local ip=$1
    local valid_ip_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
    if [[ $ip =~ $valid_ip_regex ]]; then
        for octet in $(echo $ip | tr '.' ' '); do
            if ((octet < 0 || octet > 255)); then
                return 1
            fi
        done
        return 0
    else
        return 1
    fi
}

# Validation d'un nom de domaine
function validate_domain() {
    local domain=$1
    local valid_domain_regex="^([a-zA-Z0-9](-*[a-zA-Z0-9])*\.)+[a-zA-Z]{2,}$"
    [[ $domain =~ $valid_domain_regex ]]
}

#-------------------------------------------// DEMANDE DE SAISIES //--------------------------------------------
while true; do
    read -p "Adresse de votre serveur (exemple 10.0.0.53) : " OWNIP
    if validate_ip "$OWNIP"; then
        break
    else
        echo "Adresse IP invalide. Entrez une adresse IPv4 valide."
    fi
done

while true; do
    read -p "Nom de votre domaine (ex: exemple.com) : " DOMAIN
    if validate_domain "$DOMAIN"; then
        break
    else
        echo "Nom de domaine invalide. Entrez un nom valide."
    fi
done

#-------------------------------------------// VARIABLES //--------------------------------------------
CONFDIR=/etc/bind
NETWORK=$(echo ${OWNIP} | cut -d '.' -f 1-3)
REVADDR=$(echo ${NETWORK} | awk -F '.' '{print $3"."$2"."$1"."}')
SERIAL="$(date '+%Y%m%d')01"

#-------------------------------------------// CRÉATION DES FICHIERS //--------------------------------------------
# named.conf.local
sudo bash -c "cat > ${CONFDIR}/named.conf.local" <<-EOF
zone "${DOMAIN}" {
 	type master;
 	notify no;
 	file "${CONFDIR}/db.${DOMAIN}";
};
zone "${REVADDR}in-addr.arpa" {
 	type master;
 	notify no;
 	file "${CONFDIR}/db.${REVADDR}in-addr.arpa";
};
EOF

# db.DOMAIN file
sudo bash -c "cat > ${CONFDIR}/db.${DOMAIN}" <<-EOF
\$TTL 604800
@       IN      SOA     ns.${DOMAIN}. root.${DOMAIN}. (
                        ${SERIAL}     ; Serial
                        604800        ; Refresh
                        86400         ; Retry
                        2419200       ; Expire
                        604800 )      ; Negative Cache TTL
;
@       IN      NS      ns.${DOMAIN}.
@       IN      A       ${OWNIP}
ns      IN      A       ${OWNIP}
www     IN      A       ${OWNIP}
EOF

# Reverse DNS db.REVADDR file
OWNH=$(echo ${OWNIP} | cut -d '.' -f 4)
sudo bash -c "cat > ${CONFDIR}/db.${REVADDR}in-addr.arpa" <<-EOF
\$ORIGIN ${REVADDR}in-addr.arpa.
\$TTL 1d
@       IN      SOA     ns.${DOMAIN}. root.${DOMAIN}. (
                        ${SERIAL}     ; Serial
                        86400         ; Refresh
                        7200          ; Retry
                        2592000       ; Expire
                        172800 )      ; Negative Cache TTL
;
@       IN      NS      ns.${DOMAIN}.
${OWNH} IN      PTR     ns.${DOMAIN}.
EOF

#-------------------------------------------// VÉRIFICATION ET REDÉMARRAGE //--------------------------------------------
sudo named-checkconf && \
sudo named-checkzone "${DOMAIN}" "${CONFDIR}/db.${DOMAIN}" && \
sudo named-checkzone "${REVADDR}in-addr.arpa" "${CONFDIR}/db.${REVADDR}in-addr.arpa" && \
sudo systemctl restart bind9 && \
echo "Configuration DNS réussie pour '${DOMAIN}' avec l'IP '${OWNIP}' !" || \
echo "Échec de la configuration DNS."
