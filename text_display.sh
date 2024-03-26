#!/bin/bash

# Check if figlet and pv are installed
if ! command -v figlet &> /dev/null || ! command -v pv &> /dev/null; then
    echo "Error: This script requires 'figlet' and 'pv' to be installed. Please install them."
    exit 1
fi

# Function to display text using figlet and pv
display_text() {
    echo "$1" | figlet -f standard | pv -qL 10
}

# Main script
echo "Type a message and press Enter (Ctrl+D to exit):"
while IFS= read -r input; do
    display_text "$input"
    echo -e "\nType another message and press Enter (Ctrl+D to exit):"
done
