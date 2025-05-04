#!/bin/bash

# Main menu handler for the USSD simulator

# Source utility and other scripts
source scripts/utils.sh
source scripts/for_who.sh
source scripts/balance_check.sh
source scripts/airtime_topup.sh

ussd_main() {
    while true; do
        echo "Welcome to Ethio Telecom USSD Simulator"
        echo "1. Check Balance"
        echo "2. Top-up Airtime"
        echo "3. Buy Package"
        echo "4. Exit"
        read -p "Select Option: " option

        echo "[LOG] Selected option: $option" >> logs/ussd_log.txt

        case $option in
            1)
                check_balance
                ;;
            2)
                top_up_airtime
                ;;
            3)
                buy_package_menu
                ;;
            4)
                echo "Thank you for using Ethio Telecom USSD Simulator. Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
        echo
    done
}

# Call the main menu function if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    ussd_main
fi