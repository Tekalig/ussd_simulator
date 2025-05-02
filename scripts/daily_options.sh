#!/bin/bash

# Function to display daily options
display_daily_options() {
    echo "1. Daily Voice Package"
    echo "2. Daily Internet Package"
    echo "3. Daily SMS Package"
    echo "*. Back to Previous"
}

# Function to handle user selection for daily options
handle_daily_selection() {
    read -p "Please select a daily option: " daily_choice

    case $daily_choice in
        1)
            echo "You selected Daily Voice Package."
            # Add logic for Daily Voice Package here
            ;;
        2)
            echo "You selected Daily Internet Package."
            # Add logic for Daily Internet Package here
            ;;
        3)
            echo "You selected Daily SMS Package."
            # Add logic for Daily SMS Package here
            ;;
        "*")
            echo "Returning to Previous Menu."
            # Call the previous menu procedure here
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_daily_selection
            ;;
    esac
}

# Display the daily options and handle user input
display_daily_options
handle_daily_selection