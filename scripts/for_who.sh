#!/bin/bash

# Function to handle the "Buy Package" submenu
source scripts/package_type.sh

buy_package_menu() {
    while true; do
        echo "Package:"
        echo "1. For Yourself"
        echo "2. As a Gift"
        echo "*. Back to Main Menu"
        read -p "Select Option: " package_option

        echo "[LOG] Selected package option: $package_option" >> logs/ussd_log.txt

        case $package_option in
            1)
                package_type "self"
                ;;
            2)
                package_type "gift"
                ;;
            "*")
                break
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
        echo
    done
}