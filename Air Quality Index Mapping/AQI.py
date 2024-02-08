import folium
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

def main():
   
    api_key = '09bd2a7b591bbd09e0a3b677112aa8ee'
    
  
    location_data = get_current_location()
    if location_data is None:
        print("Unable to fetch current location.")
        return

    latitude = float(location_data['loc'].split(',')[0])
    longitude = float(location_data['loc'].split(',')[1])

   
    weather_info = get_weather(api_key, latitude, longitude)

    if weather_info is not None:
      
        print("Weather Information:")
        print(f"Temperature: {weather_info['temperature']}°C")
        print(f"Humidity: {weather_info['humidity']}%")
        print(f"Weather Conditions: {weather_info['weather_conditions']}")

   
        air_quality_data = get_air_quality(api_key, latitude, longitude)

        if air_quality_data is not None:
            
            print("\nAir Quality Information:")
            print(f"Sulfur Dioxide (SO2): {air_quality_data.get('so2', 'N/A')} µg/m³")
            print(f"Oxygen (O2): {air_quality_data.get('o3', 'N/A')} µg/m³")
            print(f"Carbon Dioxide (CO2): {air_quality_data.get('co', 'N/A')} µg/m³")

            map_center = [latitude, longitude]
            my_map = folium.Map(location=map_center, zoom_start=12)

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
            folium.Marker(location=map_center, popup=popup_text, icon=folium.Icon(color='red')).add_to(my_map)

            my_map.save('weather_and_air_quality_map.html')
            print("Weather and air quality information displayed. Map saved to 'weather_and_air_quality_map.html'")
        else:
            print("Unable to fetch air quality data.")
    else:
        print("Unable to fetch weather data.")

if __name__ == "__main__":
    main()
