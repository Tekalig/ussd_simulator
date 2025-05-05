#!/bin/bash

# Source the confirm_purchase function from daily.sh
source scripts/utils.sh

# Function to display monthly options
display_monthly_options() {
    clear  # Clear the terminal screen before showing monthly options
    echo "Monthly Voice Package."
    echo "1. Birr 100 for 1000Min and 100 SMS with 1000Min night package bonus."
    echo "2. Birr 150 for 1500Min and 150 SMS with 1500Min night package bonus."
    echo "3. Birr 200 for 2000Min and 200 SMS with 2000Min night package bonus."
    echo "*. Back to Previous"
    echo "** Main Menu"
}

# Function to handle monthly selection
handle_monthly_selection() {
    local for_who="$1"
    read -p "Please select a monthly option: " monthly_choice

    case $monthly_choice in
        1)
            confirm_purchase 100 "1000Min and 100 SMS with 1000Min night package bonus" "$for_who"
            ;;
        2)
            confirm_purchase 150 "1500Min and 150 SMS with 1500Min night package bonus" "$for_who"
            ;;
        3)
            confirm_purchase 200 "2000Min and 200 SMS with 2000Min night package bonus" "$for_who"
            ;;
        "*")
            return
            ;;
        "**")
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_monthly_selection "$for_who"
            ;;
    esac
}

# Wrapper function for monthly package
monthly_package() {
    local for_who="$1"
    display_monthly_options
    handle_monthly_selection "$for_who"
}
