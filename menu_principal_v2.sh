#!/bin/bash

# Définition des couleurs
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

# Fonction d'animation pour un chargement
loading_animation() {
    echo -n "Chargement"
    for i in {1..3}; do
        sleep 0.5
        echo -n "."
    done
    echo ""
}

# Fonction pour le bandeau d'information
info_banner() {
    echo -e "${BLUE}====================================${RESET}"
    echo -e "${CYAN}       Script de Gestion Système      ${RESET}"
    echo -e "${BLUE}====================================${RESET}"
}

# Fonction pour le Menu 1 (Installation et Configuration)
menu_install_config() {
    while true; do
        clear
        info_banner
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
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) 
                echo -e "${GREEN}Installation d'Apache2...${RESET}"
                loading_animation
                bash install/install-apache2.sh ;;
            2) 
                echo -e "${GREEN}Configuration d'Apache2...${RESET}"
                loading_animation
                bash config/config-apache2.sh ;;
            3) 
                echo -e "${GREEN}Installation du DNS...${RESET}"
                loading_animation
                bash install/install-dns.sh ;;
            4) 
                echo -e "${GREEN}Configuration du DNS...${RESET}"
                loading_animation
                bash config/config-dns_v2.sh ;;
            5) break ;;
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;
        esac
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 2 (Configuration Réseau et Services)
menu_services() {
    while true; do
        clear
        info_banner
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
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo -e "${GREEN}Installer SMTP (à implémenter)${RESET}" ;;
            2) echo -e "${GREEN}Installer SSH (à implémenter)${RESET}" ;;
            3) echo -e "${GREEN}Modifier la carte réseau (à implémenter)${RESET}" ;;
            4) echo -e "${GREEN}Gérer les profils (à implémenter)${RESET}" ;;
            5) break ;;
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;
        esac
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 3 (Gestion des Utilisateurs)
menu_utilisateurs() {
    while true; do
        clear
        info_banner
        echo -e "${CYAN}====================================${RESET}"
        echo -e "      ${GREEN}MENU GESTION UTILISATEURS${RESET}     "
        echo -e "${CYAN}====================================${RESET}"
        echo -e "${YELLOW}1) 👤 Créer un compte utilisateur${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}2) 👥 Créer un groupe${RESET}"
        echo -e "${YELLOW}------------------------------------${RESET}"
        echo -e "${YELLOW}3) 🔙 Retour au menu principal${RESET}"
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo -e "${GREEN}Créer un compte utilisateur (à implémenter)${RESET}" ;;
            2) echo -e "${GREEN}Créer un groupe (à implémenter)${RESET}" ;;
            3) break ;;
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;
        esac
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour le Menu 4 (Gestion des Fichiers)
menu_gestion_fichiers() {
    while true; do
        clear
        info_banner
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
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) echo -e "${GREEN}Rechercher un fichier (à implémenter)${RESET}" ;;
            2) echo -e "${GREEN}Supprimer un fichier (à implémenter)${RESET}" ;;
            3) echo -e "${GREEN}Sauvegarder un fichier (à implémenter)${RESET}" ;;
            4) break ;;
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;
        esac
        read -p "Appuyez sur Entrée pour continuer..."
    done
}

# Fonction pour afficher le menu principal
show_main_menu() {
    while true; do
        clear
        info_banner
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
        echo -n "Choisissez une option : "
        read choice
        case $choice in
            1) menu_install_config ;;
            2) menu_services ;;
            3) menu_utilisateurs ;;
            4) menu_gestion_fichiers ;;
            0) echo -e "${GREEN}Sortie du programme.${RESET}" ; exit 0 ;;
            *) echo -e "${RED}Option invalide. Veuillez réessayer.${RESET}" ;;
        esac
    done
}

# Appel de la fonction pour afficher le menu principal
show_main_menu
