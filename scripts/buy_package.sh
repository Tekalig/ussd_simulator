#!/bin/bash

# Simulates package purchase
source scripts/utils.sh

LOG_FILE="logs/ussd_log.txt"

echo "Available Packages:" | tee -a "$LOG_FILE"
echo "1. Data Package (1GB) - 100 ETB" | tee -a "$LOG_FILE"
echo "2. SMS Package (100 SMS) - 50 ETB" | tee -a "$LOG_FILE"
echo "3. Combo Package (500MB + 50 SMS) - 70 ETB" | tee -a "$LOG_FILE"
echo "4. Voice Package (Daily) - 30 ETB" | tee -a "$LOG_FILE"
echo "5. Voice Package (Weekly) - 150 ETB" | tee -a "$LOG_FILE"
echo "6. Voice Package (Monthly) - 500 ETB" | tee -a "$LOG_FILE"
echo "7. Voice Package (Unlimited for a Year) - 5000 ETB" | tee -a "$LOG_FILE"
echo "8. Voice Package (14 Min + 3 SMS + 15 Min Night Bonus) - 3 ETB" | tee -a "$LOG_FILE"
echo "9. Voice Package (25 Min + 5 SMS + 25 Min Night Bonus) - 5 ETB" | tee -a "$LOG_FILE"
echo "10. Voice Package (60 Min + 10 SMS + 60 Min Night Bonus) - 12 ETB" | tee -a "$LOG_FILE"
echo "11. Voice Package (80 Min + 15 SMS + 80 Min Night Bonus) - 22 ETB" | tee -a "$LOG_FILE"
echo "12. Voice Package (110 Min + 20 SMS + 110 Min Night Bonus) - 30 ETB" | tee -a "$LOG_FILE"
echo "13. Voice Package (137 Min + 25 SMS + 137 Min Night Bonus) - 35 ETB" | tee -a "$LOG_FILE"
echo "14. Voice Package (118 Min + 35 SMS + 118 Min Weekly Night Bonus) - 50 ETB" | tee -a "$LOG_FILE"
echo "15. Voice Package (199 Min + 50 SMS + 199 Min Weekly Night Bonus) - 70 ETB" | tee -a "$LOG_FILE"
echo "16. Voice Package (400 Min + 1GB + 95 SMS + 400 Min Weekly Night Bonus) - 130 ETB" | tee -a "$LOG_FILE"
echo "17. Voice Package (550 Min + 1GB + 120 SMS + 550 Min Weekly Night Bonus) - 165 ETB" | tee -a "$LOG_FILE"
echo "18. Voice Package (1330 Min + 2GB + 195 SMS + 1330 Min Weekly Night Bonus) - 270 ETB" | tee -a "$LOG_FILE"
echo "19. Voice Package (1900 Min + 380 SMS + 1900 Min Weekly Night Bonus) - 525 ETB" | tee -a "$LOG_FILE"
read -p "Select Package: " package_option

case $package_option in
    1)
        deduct_balance 100 && echo "Data Package (1GB) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    2)
        deduct_balance 50 && echo "SMS Package (100 SMS) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    3)
        deduct_balance 70 && echo "Combo Package (500MB + 50 SMS) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    4)
        deduct_balance 30 && echo "Voice Package (Daily) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    5)
        deduct_balance 150 && echo "Voice Package (Weekly) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    6)
        deduct_balance 500 && echo "Voice Package (Monthly) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    7)
        deduct_balance 5000 && echo "Voice Package (Unlimited for a Year) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    8)
        deduct_balance 3 && echo "Voice Package (14 Min + 3 SMS + 15 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    9)
        deduct_balance 5 && echo "Voice Package (25 Min + 5 SMS + 25 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    10)
        deduct_balance 12 && echo "Voice Package (60 Min + 10 SMS + 60 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    11)
        deduct_balance 22 && echo "Voice Package (80 Min + 15 SMS + 80 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    12)
        deduct_balance 30 && echo "Voice Package (110 Min + 20 SMS + 110 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    13)
        deduct_balance 35 && echo "Voice Package (137 Min + 25 SMS + 137 Min Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    14)
        deduct_balance 50 && echo "Voice Package (118 Min + 35 SMS + 118 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    15)
        deduct_balance 70 && echo "Voice Package (199 Min + 50 SMS + 199 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    16)
        deduct_balance 130 && echo "Voice Package (400 Min + 1GB + 95 SMS + 400 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    17)
        deduct_balance 165 && echo "Voice Package (550 Min + 1GB + 120 SMS + 550 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    18)
        deduct_balance 270 && echo "Voice Package (1330 Min + 2GB + 195 SMS + 1330 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    19)
        deduct_balance 525 && echo "Voice Package (1900 Min + 380 SMS + 1900 Min Weekly Night Bonus) purchased successfully!" | tee -a "$LOG_FILE"
        ;;
    *)
        echo "Invalid option. Please try again." | tee -a "$LOG_FILE"
        ;;
esac