#!/bin/bash

clear

# Create the "netMap v0.5" text using figlet and color with lolcat
figlet -f big "netMap v0.5" | lolcat -p 1.5 -S 50

# Print description
echo "netMap v0.5 will scan devices on a network IP address and this will run on interface eth0."

# Print disclaimer in red color
echo -e "\033[1;31mDisclaimer: Only for Educational Purposes.\033[0m"

# Print creator's name
echo "Created by. Joash-Jenushan"
echo "Follow me on GitHub: https://github.com/Joash-Jenushan?tab=repositories"

# Add a line separator
echo "--------------------------------------------------------------"

# Prompt for network IP to scan
read -p "Enter the network IP to scan (e.g: 100.100.1.0/24): " network_ip

# Perform device scan using arp-scan on eth0
sudo arp-scan --interface=eth0 --localnet $network_ip
