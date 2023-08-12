#!/usr/bin/env python3
import subprocess

def get_mac_address(ip_address):
    try:
        mac_address = subprocess.run(["arp", "-n", ip_address], capture_output=True, text=True, check=True).stdout.split()[2]
        return mac_address
    except (subprocess.CalledProcessError, IndexError):
        return None

def connect_to_android_device(ip_address):
    mac_address = get_mac_address(ip_address)
    if mac_address:
        print(f"Connecting to Android device with IP: {ip_address}, MAC: {mac_address}")
        try:
            subprocess.run(["adb", "connect", ip_address], check=True)
            print("Connected to the device.")
        except subprocess.CalledProcessError as e:
            print(f"Error connecting to {ip_address}: {e}")
    else:
        print("Android device not found.")

def main():
    target_ip = input("Enter the IP address of the Android device: ")
    connect_to_android_device(target_ip)

if __name__ == "__main__":
    main()
