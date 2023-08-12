#!/usr/bin/env python3

import subprocess
import pyfiglet

def center_text(text):
    termwidth = int(subprocess.check_output(['tput', 'cols']))
    padding = ' ' * ((termwidth - len(text)) // 2)
    return padding + text

def create_banner():
    banner_text = "\033[1;34m" + pyfiglet.Figlet().renderText("netMap V1.0") + "\033[0m"
    note_text = "\033[;34m netMap V1.0 Will Scan Your Network IP Address and Show You the Connected Devices IP Address and MAC Address.\033[0m"
    creator_text = "\033[1;32mCreated by. Joash Jenushan\033[0m"

    print(center_text(banner_text))
    print(center_text(note_text))
    print(center_text(creator_text))

if __name__ == "__main__":
    create_banner()

print("-----------------------------------------------------")

from scapy.all import ARP, Ether, srp

def scan(ip_range, interface):
    # Create ARP request packet
    arp = ARP(pdst=ip_range)
    ether = Ether(dst="ff:ff:ff:ff:ff:ff")
    packet = ether/arp
    
    # Send and receive packets
    result = srp(packet, timeout=3, iface=interface, verbose=False)[0]
    
    devices = []
    for sent, received in result:
        if received.psrc != ip_range.split('/')[0]:  # Exclude router IP
            devices.append({'ip': received.psrc, 'mac': received.hwsrc})
    
    return devices

def main():
    interface = "wlan0"  # interface 
    ip_range = input("Enter the IP range: ")
    
    devices = scan(ip_range, interface)
    
    print("\nDevices on the network:")
    print("-----------------------")
    for idx, device in enumerate(devices, start=1):
        print(f"Device {idx}:")
        print(f"IP: {device['ip']}")
        print(f"MAC: {device['mac']}\n")

if __name__ == "__main__":
    main()
