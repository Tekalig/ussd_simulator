# Ethio Telecom USSD Simulator

This project is a Bash scripting-based USSD service simulator replicating *999# style menus for mobile balance checks, airtime top-ups, and package purchases.

## Project Structure

```
ussd_simulator/
├── scripts/
│   ├── ussd_main.sh          # Main menu handler
│   ├── balance_check.sh      # Simulates balance check
│   ├── airtime_topup.sh      # Simulates top-up
│   ├── buy_package.sh        # Simulates package purchase
│   └── utils.sh              # Common utilities
├── data/
│   └── users.db              # Simple flat file DB for user balances
├── logs/
│   └── ussd_log.txt          # USSD session logs
├── config/
│   └── settings.conf         # Configurable service variables
└── README.md                 # Project overview and instructions
```

## Features
- USSD main menu simulation.
- Check user balance.
- Top up airtime.
- Buy mobile packages (data, SMS, combo).
- Log USSD session actions.
- Flat file `users.db` to simulate user data.
- Configurable settings via `settings.conf`.

## Requirements
- Bash 4.x+
- No external dependencies

## Usage
Run the `ussd_main.sh` script to start the simulation:
```bash
bash scripts/ussd_main.sh
```