import folium
import requests

def get_weather(api_key, city):
    weather_url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}"
    response = requests.get(weather_url)
    
    if response.status_code == 200:
        data = response.json()
        return data
    else:
        print(f"Error fetching data for {city}: {response.status_code}")
        return None

def add_marker(map_obj, location, popup_text, color):
    folium.Marker(location, popup=popup_text, icon=folium.Icon(color=color)).add_to(map_obj)

def get_weather_color(weather_condition):
    # Map specific weather conditions to distinct colors
    if 'rain' in weather_condition.lower():
        return 'blue'
    elif 'cloud' in weather_condition.lower():
        return 'gray'
    elif 'clear' in weather_condition.lower():
        return 'yellow'
    else:
        return 'green'

def display_weather_on_map(api_key, cities):
    weather_map = folium.Map(location=[0, 0], zoom_start=2)

    for city in cities:
        data = get_weather(api_key, city)

        if data and 'coord' in data:
            lat, lon = data['coord']['lat'], data['coord']['lon']
            temperature = data['main']['temp']
            weather_condition = data['weather'][0]['description']

            color = get_weather_color(weather_condition)
            popup_text = f"City: {city}<br>Temperature: {temperature} K <br>Weather: {weather_condition}"
            add_marker(weather_map, [lat, lon], popup_text, color)

    weather_map.save("weather_map.html")

if __name__ == "__main__":
    # Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
    openweathermap_api_key = '09bd2a7b591bbd09e0a3b677112aa8ee'

    # List of cities to display weather information (you can add more cities)
    cities = ['London', 'New York', 'Tokyo', 'Sydney', 'Mumbai']  # Add more cities as needed

    display_weather_on_map(openweathermap_api_key, cities)
