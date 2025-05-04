#!/bin/bash

# Source the confirm_purchase function from daily.sh
source scripts/utils.sh

# Function to display weekly options
display_weekly_options() {
    echo "Weekly Voice Package."
    echo "1. Birr 20 for 150Min and 20 SMS with 150Min night package bonus."
    echo "2. Birr 30 for 250Min and 30 SMS with 250Min night package bonus."
    echo "3. Birr 50 for 500Min and 50 SMS with 500Min night package bonus."
    echo "*. Back to Previous"
    echo "** Main Menu"
}

# Function to handle weekly selection
handle_weekly_selection() {
    local for_who="$1"
    read -p "Please select a weekly option: " weekly_choice

    case $weekly_choice in
        1)
            confirm_purchase 20 "150Min and 20 SMS with 150Min night package bonus" "$for_who"
            ;;
        2)
            confirm_purchase 30 "250Min and 30 SMS with 250Min night package bonus" "$for_who"
            ;;
        3)
            confirm_purchase 50 "500Min and 50 SMS with 500Min night package bonus" "$for_who"
            ;;
        "*")
            return
            ;;
        "**")
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_weekly_selection "$for_who"
            ;;
    esac
}

# Wrapper function for weekly package
weekly_package() {
    local for_who="$1"
    display_weekly_options
    handle_weekly_selection "$for_who"
}
