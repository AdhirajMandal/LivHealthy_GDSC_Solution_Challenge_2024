import folium
import requests
import firebase_admin
from firebase_admin import credentials, firestore

def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

def retrieve_accident_coordinates():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()
    
    accident_coordinates = []
    for doc in docs:
        accident_data = doc.to_dict()
        accident_coordinates.append({
            'latitude': float(accident_data['latitude']),
            'longitude': float(accident_data['longitude']),
        })

    return accident_coordinates

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
            return None
    except Exception as e:
        print(f"Error: {e}")
        return None

def get_weather(api_key, latitude, longitude):
    base_url = "http://api.openweathermap.org/data/2.5/weather"
    params = {
        "lat": latitude,
        "lon": longitude,
        "appid": api_key,
        "units": "metric",  # Use metric units for temperature in Celsius
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    if "main" in data and "weather" in data:
        temperature = data["main"]["temp"]
        humidity = data["main"]["humidity"]
        weather_conditions = data["weather"][0]["description"]
        
        return {
            'temperature': temperature,
            'humidity': humidity,
            'weather_conditions': weather_conditions,
        }
    else:
        return None

def get_air_quality(api_key, latitude, longitude):
    base_url = "http://api.openweathermap.org/data/2.5/air_pollution"
    params = {
        "lat": latitude,
        "lon": longitude,
        "appid": api_key,
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    if "list" in data:
        air_quality_data = data["list"][0]["components"]
        return air_quality_data
    else:
        return None

def create_map(center_location, zoom_start=12):
    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations, icon_color, popup_text=''):
    for location in locations:
        folium.Marker(
            location=[location['latitude'], location['longitude']],
            popup=popup_text,
            icon=folium.Icon(color=icon_color, icon='info-sign')
        ).add_to(map_object)

def main():
    api_key = '09bd2a7b591bbd09e0a3b677112aa8ee'
    
    initialize_firebase()
    
    # Retrieve accident coordinates from Firebase
    accident_coordinates = retrieve_accident_coordinates()

    # Retrieve current location
    location_data = get_current_location()
    if location_data is None:
        print("Unable to fetch current location.")
        return

    latitude = float(location_data['loc'].split(',')[0])
    longitude = float(location_data['loc'].split(',')[1])

    # Get weather information and air quality data
    weather_info = get_weather(api_key, latitude, longitude)
    air_quality_data = get_air_quality(api_key, latitude, longitude)

    if weather_info is not None and air_quality_data is not None:
        print("Weather Information:")
        print(f"Temperature: {weather_info['temperature']}°C")
        print(f"Humidity: {weather_info['humidity']}%")
        print(f"Weather Conditions: {weather_info['weather_conditions']}")

        print("\nAir Quality Information:")
        print(f"Sulfur Dioxide (SO2): {air_quality_data.get('so2', 'N/A')} µg/m³")
        print(f"Oxygen (O2): {air_quality_data.get('o3', 'N/A')} µg/m³")
        print(f"Carbon Dioxide (CO2): {air_quality_data.get('co', 'N/A')} µg/m³")

        map_center = [latitude, longitude]
        my_map = create_map(map_center, zoom_start=12)

        popup_text = (
            f"Weather Information:\n"
            f"Temperature: {weather_info['temperature']}°C\n"
            f"Humidity: {weather_info['humidity']}%\n"
            f"Weather Conditions: {weather_info['weather_conditions']}\n\n"
            f"Air Quality Information:\n"
            f"Sulfur Dioxide (SO2): {air_quality_data.get('so2', 'N/A')} µg/m³\n"
            f"Oxygen (O2): {air_quality_data.get('o3', 'N/A')} µg/m³\n"
            f"Carbon Dioxide (CO2): {air_quality_data.get('co', 'N/A')} µg/m³"
        )

        # Add markers for accident coordinates and current location
        add_markers(my_map, accident_coordinates, icon_color='black', popup_text='Accident Area')
        add_markers(my_map, [{'latitude': latitude, 'longitude': longitude}], icon_color='blue', popup_text=popup_text)

        my_map.save('combined_map.html')
        print("Weather, air quality, and accident information displayed. Map saved to 'combined_map.html'")
    else:
        print("Unable to fetch weather and air quality data.")

if __name__ == "__main__":
    main()
