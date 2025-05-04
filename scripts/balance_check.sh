#!/bin/bash

# Simulates balance check
source scripts/utils.sh

check_balance() {
    USER_BALANCE=$(get_user_balance)
    echo "Your current balance is: $USER_BALANCE ETB"
}