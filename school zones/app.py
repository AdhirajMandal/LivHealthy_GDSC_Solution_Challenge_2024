import googlemaps
import folium
from datetime import datetime
import requests
import firebase_admin
from firebase_admin import credentials, firestore

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

def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

def retrieve_accident_details():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()
    accident_coordinates = []
    for doc in docs:
        accident_data = doc.to_dict()
        latitude = accident_data.get('latitude')
        longitude = accident_data.get('longitude')
        if latitude is not None and longitude is not None:
            accident_coordinates.append((latitude, longitude))
    return accident_coordinates

API_KEY = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'  # Replace with your Google Maps API key
gmaps = googlemaps.Client(key=API_KEY)

def get_education_institutes_locations(latitude, longitude):
    places_result = gmaps.places(query='school | institute', location=(latitude, longitude), radius=5000)

    education_institutes = []
    for place in places_result['results']:
        location = place['geometry']['location']
        name = place['name']
        education_institutes.append({'location': (location['lat'], location['lng']), 'name': name})

    return education_institutes

def mark_slow_driving_areas(locations):
    slow_driving_speed = 30  # Adjust as needed

    for location in locations:
        roads_result = gmaps.nearest_roads([location['location']])
        if roads_result and 'snappedPoints' in roads_result:
            snapped_point = roads_result['snappedPoints'][0]
            place_id = snapped_point.get('placeId', None)

            if place_id:
                gmaps.speed_limits(place_id=place_id, start_time=datetime.now(), speed_limit=slow_driving_speed)

def display_on_map(locations_educational, locations_accident):
    map_center = locations_educational[0]['location']  # Center the map on the first educational institute location

    my_map = folium.Map(location=map_center, zoom_start=14)

    # Mark educational institutes on the map
    for location_data in locations_educational:
        location = location_data['location']
        name = location_data['name']
        popup_text = f"Name: {name}"
        folium.Marker(location=location, popup=popup_text, icon=folium.Icon(color='blue')).add_to(my_map)

    # Mark accident coordinates on the map
    for accident_location in locations_accident:
        popup_text = f"Accident Location\nLatitude: {accident_location[0]}, Longitude: {accident_location[1]}"
        folium.Marker(location=accident_location, popup=popup_text, icon=folium.Icon(color='black')).add_to(my_map)

    my_map.save("education_accident_map.html")
    print("Map saved as education_accident_map.html")

if __name__ == "__main__":
    my_location = get_current_location()['loc']
    latitude = float(my_location.split(',')[0])
    longitude = float(my_location.split(',')[1])

    initialize_firebase()
    accident_coordinates = retrieve_accident_details()
    education_institutes_locations = get_education_institutes_locations(latitude, longitude)
    
    mark_slow_driving_areas(education_institutes_locations)
    display_on_map(education_institutes_locations, accident_coordinates)
