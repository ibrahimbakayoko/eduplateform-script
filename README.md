# eduplateform-script
# eduplateform-script
/opt/automatisation/                # Dossier principal pour l'automatisation
│
├── install/                        # Scripts d'installation
│   ├── install-apache2.sh         # Script d'installation d'Apache2
│   ├── install-dns.sh             # Script d'installation de DNS
│   ├── install-smtp.sh            # (à implémenter) Script d'installation de SMTP
│   ├── install-ssh.sh              # (à implémenter) Script d'installation de SSH
│   └── ...                         # Autres scripts d'installation
│
├── config/                         # Scripts de configuration
│   ├── config-apache2.sh          # Script de configuration d'Apache2
│   ├── config-dns.sh              # Script de configuration de DNS
│   ├── config-smtp.sh             # (à implémenter) Script de configuration de SMTP
│   ├── config-ssh.sh              # (à implémenter) Script de configuration de SSH
│   └── ...                         # Autres scripts de configuration
│
├── users/                          # Scripts de gestion des utilisateurs
│   ├── create-user.sh              # Script de création d'un utilisateur
│   ├── create-group.sh             # Script de création d'un groupe
│   └── ...                         # Autres scripts de gestion des utilisateurs
│
├── files/                          # Scripts de gestion des fichiers
│   ├── search-file.sh              # Script de recherche de fichiers
│   ├── delete-file.sh              # Script de suppression de fichiers
│   ├── backup-file.sh              # Script de sauvegarde de fichiers
│   └── ...                         # Autres scripts de gestion des fichiers
│
└── menu_principal.sh              # Script principal qui lance le menu

