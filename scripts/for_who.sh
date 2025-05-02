#!/bin/bash

# Function to handle the "Buy Package" submenu
function buy_package_menu() {
    while true; do
        echo "Buy Package Options:"
        echo "1. For Yourself"
        echo "2. As a Gift"
        echo "*. Back to Main Menu"
        read -p "Select Option: " package_option

        case $package_option in
            1)
                bash scripts/package_type.sh --self
                ;;
            2)
                bash scripts/package_type.sh --gift
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