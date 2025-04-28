#!/bin/bash

# Common utilities for the USSD simulator

# Get user balance from the database
get_user_balance() {
    grep "^balance=" data/users.db | cut -d'=' -f2
}

# Deduct balance for a transaction
deduct_balance() {
    local amount=$1
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
    local current_balance=$(get_user_balance)
    local new_balance=$((current_balance + amount))
    sed -i "s/^balance=.*/balance=$new_balance/" data/users.db
}

# Validate top-up code
validate_topup_code() {
    local code=$1
    [[ $code =~ ^[0-9]{5}$ ]]  # Example: Valid codes are 5-digit numbers
}