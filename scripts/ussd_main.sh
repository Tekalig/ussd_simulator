#!/bin/bash

# Main menu handler for the USSD simulator

while true; do
    echo "Welcome to Ethio Telecom USSD Simulator"
    echo "1. Check Balance"
    echo "2. Top-up Airtime"
    echo "3. Buy Package"
    echo "4. Exit"
    read -p "Select Option: " option

    case $option in
        1)
            bash scripts/balance_check.sh
            ;;
        2)
            bash scripts/airtime_topup.sh
            ;;
        3)
            bash scripts/buy_package.sh
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