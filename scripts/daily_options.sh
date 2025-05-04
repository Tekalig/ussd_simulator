#!/bin/bash

# Parse arguments to determine if the package is for self or gift
for_who="self" # Default to self
while [[ $# -gt 0 ]]; do
    case $1 in
        --self)
            for_who="self"
            shift
            ;;
        --gift)
            for_who="gift"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Function to display daily options
display_daily_options() {
    echo "Daily Voice Package."
    echo "1. Birr 3 for 14MIn and 3 SMS with 14Min night package bonus."
    echo "2. Birr 5 for 25MIn and 5 SMS with 25Min night package bonus."
    echo "3. Birr 10 for 60MIn and 10 SMS with 60Min night package bonus."
    echo "4. Birr 15 for 100MIn and 15 SMS with 100Min night package bonus."
    echo "*. Back to Previous"
    echo "** Main Menu"
}

# After handling daily options, return to the main menu
handle_daily_selection() {
    read -p "Please select a daily option: " daily_choice

    case $daily_choice in
        1)
            echo "You selected Birr 3 for 14Min and 3 SMS with 14Min night package bonus."
            confirm_purchase 3 "14Min and 3 SMS with 14Min night package bonus" "$for_who"
            ;;
        2)
            echo "You selected Birr 5 for 25Min and 5 SMS with 25Min night package bonus."
            confirm_purchase 5 "25Min and 5 SMS with 25Min night package bonus" "$for_who"
            ;;
        3)
            echo "You selected Birr 10 for 60Min and 10 SMS with 60Min night package bonus."
            confirm_purchase 10 "60Min and 10 SMS with 60Min night package bonus" "$for_who"
            ;;
        4)
            echo "You selected Birr 15 for 100Min and 15 SMS with 100Min night package bonus."
            confirm_purchase 15 "100Min and 15 SMS with 100Min night package bonus" "$for_who"
            ;;
        "*")
            echo "Returning to Previous Menu."
            return
            ;;
        "**")
            echo "Returning to Main Menu."
            return
            ;;
        *)
            echo "Invalid selection. Please try again."
            handle_daily_selection
            ;;
    esac

    # After handling the selection, return to the main menu
    bash scripts/ussd_main.sh
}

confirm_purchase() {
    local cost=$1
    local package_details=$2
    local for_who=$3

    read -p "Are you sure you want to buy this package for Birr $cost? (1 for Yes, 0 for No): " confirmation
    if [[ $confirmation -eq 1 ]]; then
        if [[ $for_who == "self" ]]; then
            # Deduct the cost from the user's balance (assuming balance is stored in a variable)
            if [[ $balance -ge $cost ]]; then
                balance=$((balance - cost))
                echo "Purchase successful! You bought $package_details."
                echo "Your new balance is Birr $balance."
            else
                echo "Insufficient balance. Please recharge and try again."
            fi
        elif [[ $for_who == "gift" ]]; then
            read -p "Please enter the receiver's phone number: " receiver_number
            # Validate Ethiopian phone number format
            if [[ $receiver_number =~ ^09[0-9]{8}$ ]]; then
                echo "Processing gift purchase for $receiver_number..."
                # Deduct the cost from the user's balance (assuming balance is stored in a variable)
                if [[ $balance -ge $cost ]]; then
                    balance=$((balance - cost))
                    echo "Purchase successful! You gifted $package_details to $receiver_number."
                    echo "Your new balance is Birr $balance."
                else
                    echo "Insufficient balance. Please recharge and try again."
                fi
            else
                echo "Invalid phone number format. Please try again."
                confirm_purchase $cost "$package_details" "gift"
            fi
        fi
    else
        echo "Purchase canceled."
    fi
}

# Display the daily options and handle user input
display_daily_options
handle_daily_selection