#!/bin/bash

source scripts/utils.sh

# Function to display daily options
display_daily_options() {
    echo "Daily Voice Package."
    echo "1. Birr 3 for 14Min and 3 SMS with 14Min night package bonus."
    echo "2. Birr 5 for 25Min and 5 SMS with 25Min night package bonus."
    echo "3. Birr 10 for 60Min and 10 SMS with 60Min night package bonus."
    echo "4. Birr 15 for 100Min and 15 SMS with 100Min night package bonus."
    echo "*. Back to Previous"
    echo "** Main Menu"
}

# Function to handle daily selection
handle_daily_selection() {
    local for_who="$1"
    read -p "Please select a daily option: " daily_choice

    case $daily_choice in
        1)
            confirm_purchase 3 "14Min and 3 SMS with 14Min night package bonus" "$for_who"
            ;;
        2)
            confirm_purchase 5 "25Min and 5 SMS with 25Min night package bonus" "$for_who"
            ;;
        3)
            confirm_purchase 10 "60Min and 10 SMS with 60Min night package bonus" "$for_who"
            ;;
        4)
            confirm_purchase 15 "100Min and 15 SMS with 100Min night package bonus" "$for_who"
            ;;
        "*")
            return
            ;;
        "**")
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_daily_selection "$for_who"
            ;;
    esac
}

# Wrapper function for daily package
daily_package() {
    local for_who="$1"
    display_daily_options
    handle_daily_selection "$for_who"
}