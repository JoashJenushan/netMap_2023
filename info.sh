#!/bin/bash

clear

# Create the "netMap" text using figlet and color with lolcat
figlet -f slant "netMap" | lolcat -p 2.5 -S 20

# Print the description
echo -e "Using \033[;34mnetMap\033[0m will allow you to scan and find Devices on your Network using nmap and adb. I hope \033[;34mnetMap\033[0m will be a good tool for scanning."

# Print the version details
echo -e "\033[;34mnetMap\033[0m has two versions:"
echo -e "    1. \033[;34mnetMap v1.0\033[0m"
echo -e "    2. \033[;34mnetMap v2.1\033[0m"

# Print version descriptions
echo -e "\033[;34mnetMap v1.0\033[0m is the default script, which will direct you to the scanning process."
echo -e "\033[;34mnetMap v2.1\033[0m is the same script, but when you run this as root, it'll scan for tools called 'adb' and 'scapy'. If they're available on your device, you will be directed to the scanning process. If they're not available, don't worry, \033[;34mnetMap\033[0m v2.1 will install the requirements for you."


# Print disclaimer in red bold font
echo -e "\033[1;31mDisclaimer: This tool is for educational purposes only!\033[0m"

# Print usage instructions
echo -e "\n\033[;34mUsage:\033[0m"
echo -e "chmod +x netMap_v1.0_2023.sh"
echo -e "sudo ./netMap_v1.0_2023.sh"
echo -e "Enter the IP range: \033[;34m<Your network IP>\033[0m"

# Function to center-align text in the terminal
center_text() {
  termwidth=$(tput cols)
  padding="$(printf '%0.1s' ' '{1..500})"
  printf "%*.*s %s %*.*s\n" 0 $((($termwidth - 2 - ${#1}) / 2)) "$padding" "$1" 0 $((($termwidth - 1 - ${#1}) / 2)) "$padding"
}

# Call the function
center_text "$1" "$2"

