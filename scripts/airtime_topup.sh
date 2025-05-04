#!/bin/bash

# Simulates airtime top-up
source scripts/utils.sh

top_up_airtime() {
    read -p "Enter top-up code: " topup_code
    if validate_topup_code "$topup_code"; then
        add_airtime 50  # Example: Add 50 ETB for valid top-up code
        echo "Top-up successful! 50 ETB has been added to your balance."
    else
        echo "Invalid top-up code. Please try again."
    fi
}