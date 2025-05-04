#!/bin/bash

# Function to handle the "Buy Package" submenu
function buy_package_menu() {
    while true; do
        echo "Package:"
        echo "1. For Yourself"
        echo "2. As a Gift"
        echo "*. Back to Main Menu"
        read -p "Select Option: " package_option

        case $package_option in
            1)
                bash scripts/package_type.sh --self
                exit 0 # Exit after handling the package selection
                ;;
            2)
                bash scripts/package_type.sh --gift
                exit 0 # Exit after handling the package selection
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