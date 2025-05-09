#!/bin/bash

# Common utilities for the USSD simulator

# Add logging to track utility function calls
log_message() {
    echo "[LOG] $(date '+%Y-%m-%d %H:%M:%S') - $1" >> logs/ussd_log.txt
}

# Get user balance from the database
get_user_balance() {
    log_message "Retrieving user balance."
    grep "^balance=" data/users.txt | cut -d'=' -f2
}

# check user to continue
check_user_continue() {
    echo "Thank you for using our service!"
    echo "Do you want to continue using our service? (1 for Yes, 0 for No): "
    read continue_shopping
    if [[ $continue_shopping -eq 1 ]]; then
        ussd_main
    else
        echo "Thank you for using our service. Goodbye!"
        exit 0
    fi
}

# Deduct balance for a transaction
deduct_balance() {
    local amount=$1
    log_message "Deducting balance: $amount"
    local current_balance=$(get_user_balance)
    if (( current_balance >= amount )); then
        local new_balance=$((current_balance - amount))
        sed -i "s/^balance=.*/balance=$new_balance/" data/users.db
        return 0
    else
        echo "Insufficient balance."
        return 1
    fi
}

# Add airtime to the balance
add_airtime() {
    local amount=$1
    log_message "Adding airtime: $amount"
    local current_balance=$(get_user_balance)
    local new_balance=$((current_balance + amount))
    sed -i "s/^balance=.*/balance=$new_balance/" data/users.db
}

# Update the user's balance in place
update_balance() {
    local new_balance=$1
    sed -i "s/^balance=.*/balance=$new_balance/" data/users.txt
}

# Validate top-up code
validate_topup_code() {
    local code=$1
    [[ $code =~ ^[0-9]{5}$ ]]  # Example: Valid codes are 5-digit numbers
}

# Function to confirm the receiver's phone number
confirm_receiver_number() {
    clear  # Clear the terminal screen before confirming the receiver's phone number
    local receiver_number
    while true; do
        read -p "Please enter the receiver's phone number: " receiver_number
        # Validate Ethiopian phone number format
        if [[ $receiver_number =~ ^09[0-9]{8}$ ]]; then
            echo "Receiver's phone number: $receiver_number"
            read -p "Is this $receiver_number number correct? (1 for Yes, 0 for No): " confirmation
            if [[ $confirmation -eq 1 ]]; then
                echo "Processing gift purchase for $receiver_number..."
                break
            else
                echo "Please re-enter the receiver's phone number."
            fi
        else
            echo "Invalid phone number format. Please try again."
        fi
    done
    echo "$receiver_number"
}

# Updated confirm_purchase function
confirm_purchase() {
    local cost=$1
    local package_details=$2
    local for_who=$3
    local balance=$(get_user_balance)

    read -p "Are you sure you want to buy this package for Birr $cost? (1 for Yes, 0 for No): " confirmation
    if [[ $confirmation -eq 1 ]]; then
        if [[ $for_who == "self" ]]; then
            if [[ $balance -ge $cost ]]; then
                balance=$((balance - cost))
                update_balance $balance
                echo "Purchase successful! You bought $package_details."
                echo "Your new balance is Birr $balance."
            else
                echo "Insufficient balance. Please recharge and try again."
            fi
        elif [[ $for_who == "gift" ]]; then
            local receiver_number
            receiver_number=$(confirm_receiver_number)
            if [[ $balance -ge $cost ]]; then
                balance=$((balance - cost))
                update_balance $balance
                echo "Purchase successful! You gifted $package_details to $receiver_number."
                echo "Your new balance is Birr $balance."
            else
                echo "Insufficient balance. Please recharge and try again."
            fi
        fi
    else
        echo "Purchase canceled."
    fi

    check_user_continue
}