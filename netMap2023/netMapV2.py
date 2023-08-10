#!/usr/bin/env python3
import subprocess
import shutil
import sys
import os

def check_and_install(package):
    try:
        __import__(package)
        print(f"{package} is already installed.")
    except ImportError:
        print(f"{package} is not installed. Installing...")
        subprocess.run(["sudo", "apt-get", "install", "-y", package])

def check_interface(interface):
    if not os.path.exists(f"/sys/class/net/{interface}"):
        print("\033[1;31mThere is no Interface wlan0, Scanning on Interface eth0.\033[0m")
        return "eth0"
    return interface

def run_another_program(program_file):
    print("\nRequirements fullfilled.")
    input("Press Enter to continue...")
    subprocess.run(["clear"])
    
    interface = check_interface("wlan0")
    subprocess.run(["python3", program_file, interface])

def main():
    check_and_install("scapy")
    check_and_install("adb")
    
    program_file = "netMapV1.py"  # Replace with your program's filename
    
    run_another_program(program_file)

if __name__ == "__main__":
    main()
