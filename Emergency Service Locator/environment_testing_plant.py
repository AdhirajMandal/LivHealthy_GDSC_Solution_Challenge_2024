import googlemaps
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

def retrieve_environmental_testing_plants(api_key, location, keyword, radius=5000):
    gmaps = googlemaps.Client(key=api_key)
    
    params = {
        'location': location,
        'radius': radius,
        'keyword': keyword,
    }
    
    places_result = gmaps.places_nearby(**params)
    
    locations = []
    for place in places_result.get('results', []):
        location_info = {
            'name': place['name'],
            'address': place.get('vicinity', 'N/A'),
            'location': place['geometry']['location'],
        }
        locations.append(location_info)
    
    return locations

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

def create_map(center_location, zoom_start=12):
    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations, icon_color, popup_text=''):
    for location in locations:
        if 'name' in location and 'location' in location:
            lat, lng = location['location']['lat'], location['location']['lng']
            name = location['name']
            address = location.get('address', '')
        elif 'latitude' in location and 'longitude' in location:
            lat, lng = location['latitude'], location['longitude']
            name = 'Accident Area'
            address = ''
        else:
            raise ValueError(f"Invalid location format: {location}")

        folium.Marker(
            location=[lat, lng],
            popup=f"{name} - {address} {popup_text}",
            icon=folium.Icon(color=icon_color, icon='info-sign')
        ).add_to(map_object)

def main():
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    
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

    # Retrieve environmental testing plant locations
    search_keyword = 'Environmental testing plants near me'
    search_radius = 5000
    environmental_testing_plants = retrieve_environmental_testing_plants(api_key, f"{latitude},{longitude}", search_keyword, search_radius)

    # Create Folium map
    map_center = [latitude, longitude]
    my_map = create_map(map_center, zoom_start=12)

    # Add markers for accident coordinates and environmental testing plant locations
    add_markers(my_map, accident_coordinates, icon_color='black', popup_text='Accident Area')
    add_markers(my_map, environmental_testing_plants, icon_color='green', popup_text='Environmental Testing Plant')

    my_map.save('combined_map.html')
    print("Accident coordinates and environmental testing plant locations marked. Map saved to 'combined_map.html'")

if __name__ == "__main__":
    main()
