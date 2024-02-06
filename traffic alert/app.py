import tkinter as tk
from tkinter import messagebox
import requests

def get_current_location(api_key):
    dummy_ip_address = "152.58.179.91"
    
    ipinfo_url = f"https://ipinfo.io/{dummy_ip_address}/json?token={api_key}"
    response = requests.get(ipinfo_url)
    data = response.json()

    if 'loc' in data:
        lat, lng = map(float, data['loc'].split(','))
        return lat, lng
    else:
        print("Error: No location information found for the provided IP address.")
        return None, None

def check_accident_prone_zone(api_key, lat, lng):
    accident_prone_zone = False
    # You may implement a more sophisticated algorithm or use additional APIs for this.
    return accident_prone_zone

def check_traffic_jam(api_key, lat, lng):
    heavy_traffic_jam = False
    # You may implement a more sophisticated algorithm or use additional APIs for this.
    return heavy_traffic_jam

def show_alert_window(message):
    # Create a new top-level window for displaying the alert message
    alert_window = tk.Toplevel()
    alert_window.title("Traffic Alert")

    # Create a label with the alert message
    label = tk.Label(alert_window, text=message, padx=20, pady=20)
    label.pack()

    # Run the alert window
    alert_window.mainloop()

def main(api_key):
    lat, lng = (22.594480, 88.265690)
    
    # Check for accident-prone zone
    if check_accident_prone_zone(api_key, lat, lng):
        show_alert_window("You are in an accident-prone zone!")

    # Check for heavy traffic jam
    if check_traffic_jam(api_key, lat, lng):
        show_alert_window("You are near a heavy traffic jam!")

if __name__ == "__main__":
    google_api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    main(google_api_key)
