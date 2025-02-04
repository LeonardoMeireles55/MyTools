#!/bin/bash

scripts=(scripts/*.sh)

display_menu() {
    echo "=========================="
    echo "    Bash Tools Menu       "
    echo "=========================="
    i=1
    for script in "${scripts[@]}"; do
        script_name=$(basename "$script" .sh)
        echo "$i) Run $script_name"
        i=$((i + 1))
    done
    echo "$i) Exit"
    echo "=========================="
}

while true; do
    display_menu
    read -p "Please select an option: " option
    script_count=${#scripts[@]}
    exit_option=$((script_count + 1))

    if [[ $option -ge 1 && $option -le $script_count ]]; then
        bash "${scripts[$((option - 1))]}"
        read -p "Script finished. Press Enter to return to the menu..."
    elif [[ $option -eq $exit_option ]]; then
        echo "Exiting..."
        exit 0
    else
        echo "Invalid option. Please try again."
    fi
done
