#!/bin/bash

# import necessary scripts
source scripts/options/daily.sh
source scripts/options/weekly.sh
source scripts/options/monthly.sh
source scripts/options/night.sh

# Function to display package durations
display_package_durations() {
    clear  # Clear the terminal screen before showing package durations
    echo "Select the duration of the package."
    echo "1. Daily"
    echo "2. Weekly"
    echo "3. Monthly"
    echo "4. Night"
    echo "**. Main Menu"
    echo "*. Back to Previous"
}
echo "Debug: Entered display_package_durations function"
# Function to handle user selection for package duration
handle_duration_selection() {
    local for_who="$1"
    read -p "Please select a duration: " duration_choice

    echo "[LOG] Selected duration: $duration_choice" >> logs/ussd_log.txt

    case $duration_choice in
        1)
            echo "You selected Daily."
            sleep 2  # Simulate a short delay for user experience
            daily_package "$for_who"
            ;;
        2)
            echo "You selected Weekly."
            sleep 2  # Simulate a short delay for user experience
            weekly_package "$for_who"
            ;;
        3)
            echo "You selected Monthly."
            sleep 2  # Simulate a short delay for user experience
            monthly_package "$for_who"
            ;;
        4)
            echo "You selected Night."
            sleep 2  # Simulate a short delay for user experience
            night_package "$for_who"
            ;;
        "**")
            echo "Returning to Main Menu."
            sleep 2  # Simulate a short delay for user experience
            return
            ;;
        "*")
            echo "Returning to Previous Menu."
            sleep 2  # Simulate a short delay for user experience
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_duration_selection "$for_who"
            ;;
    esac
}

# Wrapper function for package duration
package_duration() {
    local for_who="$1"
    display_package_durations
    handle_duration_selection "$for_who"
}