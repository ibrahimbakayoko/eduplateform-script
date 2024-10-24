#!/bin/bash

# Fonction pour le Menu 1 (Installation et Configuration)
menu_install_config() {
    while true; do
        clear
        echo "===================================="
        echo "         MENU INSTALLATION          "
        echo "===================================="
        echo "1. Installer Apache2"
        echo "2. Configurer Apache2"
        echo "3. Installer DNS"
        echo "4. Configurer DNS"
        echo "5. Retour au menu principal"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) bash install/install-apache2.sh ;;
            2) bash config/config-apache2.sh ;;
            3) bash install/install-dns.sh ;;
            4) bash config/config-dns.sh ;;
            5) break ;;
            *) echo "Option invalide. Veuillez réessayer." ;;
        esac
    done
}

# Fonction pour le Menu 2 (Configuration Réseau et Services)
menu_services() {
    while true; do
        clear
        echo "===================================="
        echo "         MENU SERVICES              "
        echo "===================================="
        echo "1. Installer SMTP"
        echo "2. Installer SSH"
        echo "3. Modifier la carte réseau"
        echo "4. Gérer les profils"
        echo "5. Retour au menu principal"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo "Installer SMTP (à implémenter)" ;;
            2) echo "Installer SSH (à implémenter)" ;;
            3) echo "Modifier la carte réseau (à implémenter)" ;;
            4) echo "Gérer les profils (à implémenter)" ;;
            5) break ;;
            *) echo "Option invalide. Veuillez réessayer." ;;
        esac
    done
}

# Fonction pour le Menu 3 (Gestion des Utilisateurs)
menu_utilisateurs() {
    while true; do
        clear
        echo "===================================="
        echo "      MENU GESTION UTILISATEURS     "
        echo "===================================="
        echo "1. Créer un compte utilisateur"
        echo "2. Créer un groupe"
        echo "3. Retour au menu principal"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo "Créer un compte utilisateur (à implémenter)" ;;
            2) echo "Créer un groupe (à implémenter)" ;;
            3) break ;;
            *) echo "Option invalide. Veuillez réessayer." ;;
        esac
    done
}

# Fonction pour le Menu 4 (Gestion des Fichiers)
menu_gestion_fichiers() {
    while true; do
        clear
        echo "===================================="
        echo "       MENU GESTION DES FICHIERS    "
        echo "===================================="
        echo "1. Rechercher un fichier"
        echo "2. Supprimer un fichier"
        echo "3. Sauvegarder un fichier"
        echo "4. Retour au menu principal"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo "Rechercher un fichier (à implémenter)" ;;
            2) echo "Supprimer un fichier (à implémenter)" ;;
            3) echo "Sauvegarder un fichier (à implémenter)" ;;
            4) break ;;
            *) echo "Option invalide. Veuillez réessayer." ;;
        esac
    done
}

# Fonction pour afficher le menu principal
show_main_menu() {
    while true; do
        clear
        echo "===================================="
        echo "          MENU PRINCIPAL           "
        echo "===================================="
        echo "1. Menu Installation et Configuration"
        echo "2. Menu Services (SMTP, SSH, Réseau)"
        echo "3. Menu Gestion des Utilisateurs"
        echo "4. Menu Gestion des Fichiers"
        echo "0. Quitter"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) menu_install_config ;;
            2) menu_services ;;
            3) menu_utilisateurs ;;
            4) menu_gestion_fichiers ;;
            0) echo "Sortie du programme." ; exit 0 ;;
            *) echo "Option invalide. Veuillez réessayer." ;;
        esac
    done
}

# Appel de la fonction pour afficher le menu principal
show_main_menu
