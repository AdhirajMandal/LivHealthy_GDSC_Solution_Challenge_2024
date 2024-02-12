import folium
import requests
from firebase_admin import credentials, firestore, initialize_app
import firebase_admin
import uuid

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
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")  # Replace with your Firebase credentials
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

# Function to retrieve accident details from Firebase
def retrieve_accident_details():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()
    accident_coordinates = []

    for doc in docs:
        accident_data = doc.to_dict()
        accident_coordinates.append({
            'latitude': accident_data.get('latitude', 0.0),
            'longitude': accident_data.get('longitude', 0.0)
        })

    return accident_coordinates


def get_places(api_key, location, radius, keyword):
    base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    params = {
        'location': location,
        'radius': radius,
        'keyword': keyword,
        'key': api_key
    }

    response = requests.get(base_url, params=params)
    results = response.json().get('results', [])

    return results
def mark_danger_zones(api_key, location, radius, industrial_keyword, factory_keyword, accident_coordinates):
    danger_zones_map = folium.Map(location=[float(coord) for coord in location.split(',')], zoom_start=13)

    industrial_areas = get_places(api_key, location, radius, industrial_keyword)
    factories = get_places(api_key, location, radius, factory_keyword)

    for place in industrial_areas:
        name = place.get('name', 'Unknown')
        geometry = place.get('geometry', {})
        location = geometry.get('location', {})
        lat = location.get('lat', 0.0)
        lng = location.get('lng', 0.0)

        folium.Marker([lat, lng], popup=f"Industrial Area: {name}", icon=folium.Icon(color='red')).add_to(danger_zones_map)

    for place in factories:
        name = place.get('name', 'Unknown')
        geometry = place.get('geometry', {})
        location = geometry.get('location', {})
        lat = location.get('lat', 0.0)
        lng = location.get('lng', 0.0)

        folium.Marker([lat, lng], popup=f"Factory: {name}", icon=folium.Icon(color='red')).add_to(danger_zones_map)

    for accident_coord in accident_coordinates:
        lat = accident_coord.get('latitude', 0.0)
        lng = accident_coord.get('longitude', 0.0)

        folium.Marker([lat, lng], popup="Accident Area", icon=folium.Icon(color='black')).add_to(danger_zones_map)

    danger_zones_map.save('danger_zones_map.html')

if __name__ == "__main__":
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    location = get_current_location()['loc']
    radius = 5000
    industrial_keyword = 'industry'
    factory_keyword = 'factory'
    
    initialize_firebase()
    accident_coordinates = retrieve_accident_details()

    mark_danger_zones(api_key, location, radius, industrial_keyword, factory_keyword, accident_coordinates)
