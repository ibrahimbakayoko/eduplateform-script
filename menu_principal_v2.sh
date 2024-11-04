#!/bin/bash

# Définition des couleurs pour l'affichage
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"  # Réinitialise la couleur

# Fonction d'animation pour simuler un chargement
loading_animation() {
    echo -n "Chargement"  # Affiche "Chargement" sans saut de ligne
    for i in {1..3}; do  # Boucle pour ajouter des points
        sleep 0.5  # Pause de 0.5 seconde
        echo -n "."  # Affiche un point sans saut de ligne
    done
    echo ""  # Saut de ligne à la fin
}

# Fonction pour afficher le bandeau d'information
info_banner() {
    echo -e "${BLUE}====================================${RESET}"  # Ligne supérieure
    echo -e "${CYAN}       Script de Gestion Système      ${RESET}"  # Titre
    echo -e "${BLUE}====================================${RESET}"  # Ligne inférieure
}

# Fonction pour le Menu 1 (Installation et Configuration)
menu_install_config() {
    while true; do  # Boucle infinie pour afficher le menu
        clear  # Efface l'écran
        info_banner  # Affiche le bandeau d'information
        
        # Affiche le titre et les options du menu
        echo -e "${CYAN}====================================${RESET}"
        echo -e "         ${GREEN}MENU INSTALLATION${RESET}          "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) ➕ Installer Apache2${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) ⚙️ Configurer Apache2${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) ➕ Installer DNS${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}4) ⚙️ Configurer DNS${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}5) 🔙 Retour au menu principal${RESET}"
        
        # Demande à l'utilisateur de choisir une option
        echo -n "Choisissez une option : "
        read choice  # Lit le choix de l'utilisateur
        
        # Structure conditionnelle pour exécuter la bonne action
        case $choice in
            1) 
                echo -e "${GREEN}Installation d'Apache2...${RESET}"  # Message d'installation
                loading_animation  # Affiche l'animation de chargement
                bash install/install-apache2.sh ;;  # Exécute le script d'installation d'Apache2
            2) 
                echo -e "${GREEN}Configuration d'Apache2...${RESET}"  # Message de configuration
                loading_animation  # Animation de chargement
                bash config/config-apache2.sh ;;  # Exécute le script de configuration d'Apache2
            3) 
                echo -e "${GREEN}Installation du DNS...${RESET}"  # Message d'installation
                loading_animation  # Animation de chargement
                bash install/install-dns.sh ;;  # Exécute le script d'installation du DNS
            4) 
                echo -e "${GREEN}Configuration du DNS...${RESET}"  # Message de configuration
                loading_animation  # Animation de chargement
                bash config/config-dns_v2.sh ;;  # Exécute le script de configuration du DNS
            5) break ;;  # Sort de la boucle pour revenir au menu principal
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;  # Gère les choix invalides
        esac
        
        # Pause avant de continuer
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 2 (Configuration Réseau et Services)
menu_services() {
    while true; do  # Boucle infinie pour afficher le menu
        clear  # Efface l'écran
        info_banner  # Affiche le bandeau d'information
        
        # Affiche le titre et les options du menu
        echo -e "${CYAN}====================================${RESET}"
        echo -e "         ${GREEN}MENU SERVICES${RESET}              "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) 📧 Installer SMTP${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) 🔒 Installer SSH${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) 🌐 Modifier la carte réseau${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}4) 👥 Gérer les profils${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}5) 🔙 Retour au menu principal${RESET}"
        
        # Demande à l'utilisateur de choisir une option
        echo -n "Choisissez une option : "
        read choice  # Lit le choix de l'utilisateur
        
        # Structure conditionnelle pour exécuter la bonne action
        case $choice in
            1) echo -e "${GREEN}Installer SMTP (à implémenter)${RESET}" ;;  # Message pour l'option SMTP
            2) echo -e "${GREEN}Installer SSH (à implémenter)${RESET}" ;;  # Message pour l'option SSH
            3) echo -e "${GREEN}Modifier la carte réseau (à implémenter)${RESET}" ;;  # Message pour l'option réseau
            4) echo -e "${GREEN}Gérer les profils (à implémenter)${RESET}" ;;  # Message pour gérer les profils
            5) break ;;  # Sort de la boucle pour revenir au menu principal
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;  # Gère les choix invalides
        esac
        
        # Pause avant de continuer
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 3 (Gestion des Utilisateurs)
menu_utilisateurs() {
    while true; do  # Boucle infinie pour afficher le menu
        clear  # Efface l'écran
        info_banner  # Affiche le bandeau d'information
        
        # Affiche le titre et les options du menu
        echo -e "${CYAN}====================================${RESET}"
        echo -e "      ${GREEN}MENU GESTION UTILISATEURS${RESET}     "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) 👤 Créer un compte utilisateur${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) 👥 Créer un groupe${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) 🔙 Retour au menu principal${RESET}"
        
        # Demande à l'utilisateur de choisir une option
        echo -n "Choisissez une option : "
        read choice  # Lit le choix de l'utilisateur
        
        # Structure conditionnelle pour exécuter la bonne action
        case $choice in
            1) echo -e "${GREEN}Créer un compte utilisateur (à implémenter)${RESET}" ;;  # Message pour l'option utilisateur
            2) echo -e "${GREEN}Créer un groupe (à implémenter)${RESET}" ;;  # Message pour l'option groupe
            3) break ;;  # Sort de la boucle pour revenir au menu principal
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;  # Gère les choix invalides
        esac
        
        # Pause avant de continuer
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 4 (Gestion des Fichiers)
menu_gestion_fichiers() {
    while true; do  # Boucle infinie pour afficher le menu
        clear  # Efface l'écran
        info_banner  # Affiche le bandeau d'information
        
        # Affiche le titre et les options du menu
        echo -e "${CYAN}====================================${RESET}"
        echo -e "       ${GREEN}MENU GESTION DES FICHIERS${RESET}    "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) 🔍 Rechercher un fichier${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) ❌ Supprimer un fichier${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) 💾 Sauvegarder un fichier${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}4) 🔙 Retour au menu principal${RESET}"
        
        # Demande à l'utilisateur de choisir une option
        echo -n "Choisissez une option : "
        read choice  # Lit le choix de l'utilisateur
        
        # Structure conditionnelle pour exécuter la bonne action
        case $choice in
            1) echo -e "${GREEN}Rechercher un fichier (à implémenter)${RESET}" ;;  # Message pour l'option recherche
            2) echo -e "${GREEN}Supprimer un fichier (à implémenter)${RESET}" ;;  # Message pour l'option suppression
            3) echo -e "${GREEN}Sauvegarder un fichier (à implémenter)${RESET}" ;;  # Message pour l'option sauvegarde
            4) break ;;  # Sort de la boucle pour revenir au menu principal
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;  # Gère les choix invalides
        esac
        
        # Pause avant de continuer
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour afficher le menu principal
show_main_menu() {
    while true; do  # Boucle infinie pour afficher le menu
        clear  # Efface l'écran
        info_banner  # Affiche le bandeau d'information
        
        # Affiche le titre et les options du menu principal
        echo -e "${CYAN}====================================${RESET}"
        echo -e "          ${GREEN}MENU PRINCIPAL${RESET}           "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) Menu Installation et Configuration${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) Menu Services (SMTP, SSH, Réseau)${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) Menu Gestion des Utilisateurs${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}4) Menu Gestion des Fichiers${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${RED}0) Quitter${RESET}"
        
        # Demande à l'utilisateur de choisir une option
        echo -n "Choisissez une option : "
        read choice  # Lit le choix de l'utilisateur
        
        # Structure conditionnelle pour exécuter la bonne action
        case $choice in
            1) menu_install_config ;;  # Appelle le menu d'installation
            2) menu_services ;;  # Appelle le menu des services
            3) menu_utilisateurs ;;  # Appelle le menu de gestion des utilisateurs
            4) menu_gestion_fichiers ;;  # Appelle le menu de gestion des fichiers
            0) echo -e "${GREEN}Sortie du programme.${RESET}" ; exit 0 ;;  # Quitte le script
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;  # Gère les choix invalides
        esac
    done
}

# Appel de la fonction pour afficher le menu principal
show_main_menu

