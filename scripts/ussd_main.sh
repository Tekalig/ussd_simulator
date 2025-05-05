#!/bin/bash

# Main menu handler for the USSD simulator

# Source utility and other scripts
source scripts/utils.sh
source scripts/for_who.sh
source scripts/balance_check.sh
source scripts/airtime_topup.sh

# Define color codes for fancy output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Log the start of the script
log_message "USSD Main script started."

# Function to display a loading animation
loading_animation() {
    echo -n -e "${CYAN}Processing"; sleep 0.5
    for i in {1..3}; do
        echo -n "."; sleep 0.5
    done
    echo -e "${RESET}"
}

ussd_main() {
    while true; do
        clear  # Clear the terminal screen before showing the main menu
        echo -e "${BLUE}Welcome to Ethio Telecom USSD Simulator${RESET}"
        echo -e "${YELLOW}1. Check Balance${RESET}"
        echo -e "${YELLOW}2. Top-up Airtime${RESET}"
        echo -e "${YELLOW}3. Buy Package${RESET}"
        echo -e "${YELLOW}4. Exit${RESET}"
        read -p "Select Option: " option

        log_message "Selected option: $option"

        case $option in
            1)
                loading_animation  # Simulate a short delay with animation
                clear  # Clear the screen before showing the balance check procedure
                check_balance
                ;;
            2)
                loading_animation  # Simulate a short delay with animation
                clear  # Clear the screen before showing the airtime top-up procedure
                top_up_airtime
                ;;
            3)
                loading_animation  # Simulate a short delay with animation
                clear  # Clear the screen before showing the package menu
                user_preferance
                ;;
            4)
                echo -e "${GREEN}Thank you for using Ethio Telecom USSD Simulator. Goodbye!${RESET}"
                log_message "USSD Main script ended."
                sleep 2  # Simulate a short delay for user experience
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please try again.${RESET}"
                ;;
        esac
        echo
    done
}

# Call the main menu function if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    ussd_main
fi