import tkinter as tk
from tkinter import messagebox
import requests
import requests

def get_current_location():
    try:
       
        response = requests.get('https://ipinfo.io/json')
        

        if response.status_code == 200:
            data = response.json()
            location = {
                'ip': data.get('ip', 'N/A'),
                'city': data.get('city', 'N/A'),
                'region': data.get('region', 'N/A'),
                'country': data.get('country', 'N/A'),
                'loc': data.get('loc', 'N/A'),  # Latitude and longitude
            }
            return location
        else:
            print(f"Error: Unable to fetch location. Status Code: {response.status_code}")
            return 'Error'
    except Exception as e:
        print(f"Error: {e}")
        return 'Error'

def check_accident_prone_zone(api_key, lat, lng):
    accident_prone_zone = False
    return accident_prone_zone

def check_traffic_jam(api_key, lat, lng):
    heavy_traffic_jam = False
    return heavy_traffic_jam

def show_alert_window(message):
    # Create a new top-level window for displaying the alert message
    alert_window = tk.Toplevel()
    alert_window.title("Traffic Alert")

    label = tk.Label(alert_window, text=message, padx=20, pady=20)
    label.pack()

    alert_window.mainloop()

def main(api_key):
    my_location = get_current_location()['loc']
    lat=(float)(my_location.split(',')[0])
    lng=(float) (my_location.split(',')[1])
    print(lat,lng)

    if check_accident_prone_zone(api_key, lat, lng):
        show_alert_window("You are in an accident-prone zone!")


    if check_traffic_jam(api_key, lat, lng):
        show_alert_window("You are near a heavy traffic jam!")

if __name__ == "__main__":
    google_api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    main(google_api_key)
