from pyowm import OWM

def get_weather(api_key, location):
    owm = OWM(api_key)
    weather_manager = owm.weather_manager()
    observation = weather_manager.weather_at_coords(*location)
    weather = observation.weather
    return weather

# Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
api_key = '09bd2a7b591bbd09e0a3b677112aa8ee'
location = (22.594480, 88.265690)

weather_conditions = get_weather(api_key, location)
print(f"Weather: {weather_conditions.status}")
