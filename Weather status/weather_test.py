from pyowm import OWM
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

def get_weather(api_key, location):
    owm = OWM(api_key)
    weather_manager = owm.weather_manager()
    observation = weather_manager.weather_at_coords(*location)
    weather = observation.weather
    return weather

api_key = '09bd2a7b591bbd09e0a3b677112aa8ee'
my_location = get_current_location()['loc']
location= ((float)(my_location.split(',')[0]),(float) (my_location.split(',')[1]))

weather_conditions = get_weather(api_key, location)
print(f"Weather: {weather_conditions.status}")
