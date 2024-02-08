import googlemaps
import folium
from datetime import datetime
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


API_KEY = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
gmaps = googlemaps.Client(key=API_KEY)

def get_education_institutes_locations():

    places_result = gmaps.places(query='school | institute', location=(latitude, longitude), radius=5000)

    education_institutes = []
    for place in places_result['results']:
        location = place['geometry']['location']
        education_institutes.append((location['lat'], location['lng']))

    return education_institutes

def mark_slow_driving_areas(locations):
    slow_driving_speed = 30  # Adjust as needed

    for location in locations:
        roads_result = gmaps.nearest_roads([location])
        if roads_result and 'snappedPoints' in roads_result:
            snapped_point = roads_result['snappedPoints'][0]
            place_id = snapped_point.get('placeId', None)

            if place_id:
                gmaps.speed_limits(place_id=place_id, start_time=datetime.now(), speed_limit=slow_driving_speed)

def display_on_map(locations):
    map_center = locations[0]  # Center the map on the first location

    my_map = folium.Map(location=map_center, zoom_start=14)

    for location in locations:
        folium.Marker(location=location, popup="Education Institute").add_to(my_map)

    my_map.save("education_institutes_map.html")
    print("Map saved as education_institutes_map.html")

if __name__ == "__main__":
    my_location = get_current_location()['loc']
    latitude = (float)(my_location.split(',')[0])
    longitude = (float) (my_location.split(',')[1])

    education_institutes_locations = get_education_institutes_locations()
    mark_slow_driving_areas(education_institutes_locations)
    display_on_map(education_institutes_locations)
