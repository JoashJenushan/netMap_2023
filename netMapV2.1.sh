#!/bin/bash

clear

# Create the "netMap v0.5" heading using figlet and color with lolcat
figlet -f slant "netMap V2.1" | lolcat -p 1.5 -S 50

# Print description
echo "netMap V2.1 will scan devices on a network IP address. This will run on interface eth0."

# Print disclaimer in red color
echo -e "\033[1;31mDisclaimer: Only for Educational Purposes\033[0m"

# Function to underline text
underline() {
  printf "%s\n" "$1"
  printf "%s\n" "${1//?/=}"
}

# Print "Created by. Joash-Jenushan"
echo "Created by. Joash-Jenushan"

# Provide link to GitHub profile
echo "Follow me on GitHub: https://github.com/Joash-Jenushan?tab=repositories"

# Underline
underline "Run the Program"

# Prompt user for network IP to scan
read -p "Enter the network IP to scan (e.g., 100.100.1.0/24): " network_ip

# Run the scanning command
sudo nmap -sn $network_ip -e eth0

# Remove the underline
echo -e "\033[0m"
