#!/bin/bash

# Function to display package durations
display_package_durations() {
    echo "1. Daily"
    echo "2. Weekly"
    echo "3. Monthly"
    echo "4. Night"
    echo "**. Main Menu"
    echo "*. Back to Previous"
}

# Function to handle user selection for package duration
handle_duration_selection() {
    read -p "Please select a duration: " duration_choice

    case $duration_choice in
        1)
            echo "You selected Daily."
            bash scripts/daily_options.sh
            ;;
        2)
            echo "You selected Weekly."
            # Call the procedure for Weekly duration here
            ;;
        3)
            echo "You selected Monthly."
            # Call the procedure for Monthly duration here
            ;;
        4)
            echo "You selected Night."
            # Call the procedure for Night duration here
            ;;
        "**")
            echo "Returning to Main Menu."
            # Call the main menu procedure here
            ;;
        "*")
            echo "Returning to Previous Menu."
            # Call the previous menu procedure here
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_duration_selection
            ;;
    esac
}

# Display the package durations and handle user input
display_package_durations
handle_duration_selection