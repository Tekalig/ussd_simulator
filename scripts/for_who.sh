#!/bin/bash

# Function to handle the "Buy Package" submenu
source scripts/package_type.sh

user_preferance() {
    while true; do
        clear  # Clear the terminal screen before showing the package menu
        echo "Package:"
        echo "1. For Yourself"
        echo "2. As a Gift"
        echo "*. Back to Main Menu"
        read -p "Select Option: " package_option


        case $package_option in
            1)
                echo "You selected to buy a package for yourself."
                sleep 2  # Simulate a short delay for user experience
                package_type "self"
                ;;
            2)
                echo "You selected to buy a package as a gift."
                sleep 2  # Simulate a short delay for user experience
                package_type "gift"
                ;;
            "*")
                echo "Returning to Main Menu..."
                break
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
        echo
    done
}