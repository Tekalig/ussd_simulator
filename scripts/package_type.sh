#!/bin/bash

# source scripts/package_duration.sh
source scripts/package_duration.sh

# Function to display package types
display_package_types() {
    clear  # Clear the terminal screen before showing package types
    echo "Package Types"
    echo "1. Voice Package"
    echo "2. Internet Package"
    echo "3. SMS Package"
    echo "4. Voice + Internet Package"
    echo "5. Voice + SMS Package"
    echo "**. Main Menu"
    echo "*. Back to Previous"
}

# Ensure user input is trimmed and validated
handle_user_selection() {
    local for_who="$1"
    while true; do
        read -p "Please select a package: " user_choice
        case $user_choice in
            1)
                echo "You selected Voice Package."
                sleep 2  # Simulate a short delay for user experience
                package_duration "$for_who"
                break
                ;;
            2)
                echo "You selected Internet Package."
                sleep 2  # Simulate a short delay for user experience
                package_duration "$for_who"
                break
                ;;
            3)
                echo "You selected SMS Package."
                sleep 2  # Simulate a short delay for user experience
                package_duration "$for_who"
                break
                ;;
            4)
                echo "You selected Voice + Internet Package."
                sleep 2  # Simulate a short delay for user experience
                package_duration "$for_who"
                break
                ;;
            5)
                echo "You selected Voice + SMS Package."
                sleep 2  # Simulate a short delay for user experience
                package_duration "$for_who"
                break
                ;;
            "**")
                echo "Returning to Main Menu."
                sleep 2  # Simulate a short delay for user experience
                source scripts/ussd_main.sh
                ussd_main
                break
                ;;
            "*")
                echo "Returning to Previous Menu."
                sleep 2  # Simulate a short delay for user experience
                break
                ;;
            *)
                echo "Invalid selection. Please try again."
                ;;
        esac
    done
}

# Wrapper function for package type
package_type() {
    local for_who="$1"
    display_package_types
    handle_user_selection "$for_who"
}