#!/bin/bash

# Source the confirm_purchase function from utils.sh
source scripts/utils.sh

# Function to display night options
display_night_options() {
    echo "Night Voice Package."
    echo "1. Birr 2 for 30Min and 5 SMS."
    echo "2. Birr 5 for 100Min and 10 SMS."
    echo "3. Birr 10 for 300Min and 20 SMS."
    echo "*. Back to Previous"
    echo "** Main Menu"
}

# Function to handle night selection
handle_night_selection() {
    local for_who="$1"
    read -p "Please select a night option: " night_choice

    case $night_choice in
        1)
            confirm_purchase 2 "30Min and 5 SMS" "$for_who"
            ;;
        2)
            confirm_purchase 5 "100Min and 10 SMS" "$for_who"
            ;;
        3)
            confirm_purchase 10 "300Min and 20 SMS" "$for_who"
            ;;
        "*")
            return
            ;;
        "**")
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_night_selection "$for_who"
            ;;
    esac
}

# Wrapper function for night package
night_package() {
    local for_who="$1"
    display_night_options
    handle_night_selection "$for_who"
}