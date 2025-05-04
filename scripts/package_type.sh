#!/bin/bash

# source scripts/package_duration.sh
source scripts/package_duration.sh
# Function to display package types
display_package_types() {
    echo "1. Voice Package"
    echo "2. Internet Package"
    echo "3. SMS Package"
    echo "4. Voice + Internet Package"
    echo "v. Voice + SMS Package"
    echo "**. Main Menu"
    echo "*. Back to Previous"
}

# Function to handle user selection
handle_user_selection() {
    local for_who="$1"
    read -p "Please select a package: " user_choice

    case $user_choice in
        1)
            echo "You selected Voice Package."
            package_duration "$for_who"
            ;;
        2)
            echo "You selected Internet Package."
            package_duration "$for_who"
            ;;
        3)
            echo "You selected SMS Package."
            package_duration "$for_who"
            ;;
        4)
            echo "You selected Voice + Internet Package."
            package_duration "$for_who"
            ;;
        v)
            echo "You selected Voice + SMS Package."
            package_duration "$for_who"
            ;;
        "**")
            echo "Returning to Main Menu."
            return
            ;;
        "*")
            echo "Returning to Previous Menu."
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_user_selection "$for_who"
            ;;
    esac
}

# Wrapper function for package type
package_type() {
    local for_who="$1"
    display_package_types
    handle_user_selection "$for_who"
}