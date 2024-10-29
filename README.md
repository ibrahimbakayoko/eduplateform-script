# EduPlatform Automation Scripts

Ce projet contient des scripts pour automatiser l'installation, la configuration, et la gestion de divers services et fonctionnalités système. La structure suivante est organisée pour faciliter la maintenance et l'évolution du projet.

## Structure des Dossiers

La structure de dossiers est organisée comme suit :

```plaintext
/opt/automatisation/                # Dossier principal pour l'automatisation
│
├── install/                        # Scripts d'installation
│   ├── install-apache2.sh          # Script d'installation d'Apache2
│   ├── install-dns.sh              # Script d'installation de DNS
│   ├── install-smtp.sh             # (à implémenter) Script d'installation de SMTP
│   ├── install-ssh.sh              # (à implémenter) Script d'installation de SSH
│   └── ...                         # Autres scripts d'installation
│
├── config/                         # Scripts de configuration
│   ├── config-apache2.sh           # Script de configuration d'Apache2
│   ├── config-dns.sh               # Script de configuration de DNS
│   ├── config-smtp.sh              # (à implémenter) Script de configuration de SMTP
│   ├── config-ssh.sh               # (à implémenter) Script de configuration de SSH
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
└── menu_principal.sh               # Script principal qui lance le menu


# EduPlatform Automation Scripts

Ce projet contient des scripts pour automatiser l'installation, la configuration, et la gestion de divers services et fonctionnalités système. La structure suivante est organisée pour faciliter la maintenance et l'évolution du projet.

## Structure des Dossiers


## Description des Dossiers et Fichiers

- **install/** : Contient les scripts d'installation pour différents services.
  - `install-apache2.sh` : Script d'installation pour Apache2.
  - `install-dns.sh` : Script d'installation pour le service DNS.
  - Scripts d'installation pour SMTP, SSH, et autres services seront ajoutés ultérieurement.

- **config/** : Contient les scripts de configuration pour les services installés.
  - `config-apache2.sh` : Script de configuration pour Apache2.
  - `config-dns.sh` : Script de configuration pour le service DNS.
  - Scripts de configuration pour SMTP, SSH, et autres services seront ajoutés ultérieurement.

- **users/** : Contient les scripts de gestion des utilisateurs et des groupes.
  - `create-user.sh` : Script pour créer un utilisateur.
  - `create-group.sh` : Script pour créer un groupe.
  - Autres scripts de gestion des utilisateurs et groupes seront ajoutés.

- **files/** : Contient les scripts de gestion des fichiers système.
  - `search-file.sh` : Script pour rechercher des fichiers.
  - `delete-file.sh` : Script pour supprimer des fichiers.
  - `backup-file.sh` : Script pour sauvegarder des fichiers.
  - Autres scripts pour la gestion des fichiers seront ajoutés.

- **menu_principal.sh** : Script principal permettant de lancer le menu interactif, qui propose des options pour l'installation et la configuration des services.

## Usage

Exécutez le fichier `menu_principal.sh` pour accéder au menu interactif et gérer les installations et configurations des services.

```bash
bash /opt/automatisation/menu_principal.sh

