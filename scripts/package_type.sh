#!/bin/bash

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
    read -p "Please select a package: " user_choice

    case $user_choice in
        1)
            echo "You selected Voice Package."
            echo "Redirecting to Voice Package options..."
            bash scripts/package_duration.sh
            # Add logic to handle Voice Package options here
            ;;
        2)
            echo "You selected Internet Package."
            # Call the procedure for Internet Package here
            ;;
        3)
            echo "You selected SMS Package."
            # Call the procedure for SMS Package here
            ;;
        4)
            echo "You selected Voice + Internet Package."
            # Call the procedure for Voice + Internet Package here
            ;;
        v)
            echo "You selected Voice + SMS Package."
            # Call the procedure for Voice + SMS Package here
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
            handle_user_selection
            ;;
    esac
}

# Display the package types and handle user input
display_package_types
handle_user_selection