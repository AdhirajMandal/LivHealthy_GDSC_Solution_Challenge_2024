import googlemaps
import folium
import requests
import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
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
            'latitude': accident_data['latitude'],
            'longitude': accident_data['longitude'],
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
            return 'Error'
    except Exception as e:
        print(f"Error: {e}")
        return 'Error'

def search_nearby_locations(api_key, location, keyword, radius=5000):
    gmaps = googlemaps.Client(key=api_key)
    params = {
        'location': location,
        'radius': radius,
        'keyword': keyword,
    }
    
    places_result = gmaps.places_nearby(**params)

    nearby_locations = []
    for place in places_result.get('results', []):
        location_info = {
            'name': place['name'],
            'address': place.get('vicinity', 'N/A'),
            'latitude': place['geometry']['location']['lat'],
            'longitude': place['geometry']['location']['lng'],
        }
        nearby_locations.append(location_info)
    
    return nearby_locations

def create_map(center_location, zoom_start=14):
    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations, marker_color='blue'):
    for location in locations:
        folium.Marker(
            location=[location['latitude'], location['longitude']],
            popup="Accident Location",
            icon=folium.Icon(color=marker_color, icon='info-sign')
        ).add_to(map_object)

def main():
    initialize_firebase()

    # Retrieve accident coordinates from Firebase
    accident_coordinates = retrieve_accident_details()

    # Retrieve current location and search for nearby arboretums
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    my_location = get_current_location()['loc']
    map_center = ((float)(my_location.split(',')[0]), (float)(my_location.split(',')[1]))

    search_keyword = 'arboretums near me'  # Change this to your desired keyword
    search_radius = 5000
    nearby_locations = search_nearby_locations(api_key, my_location, search_keyword, search_radius)

    # Create folium map centered around the current location
    my_map = create_map(map_center)

    # Add markers for accident coordinates and nearby arboretums
    add_markers(my_map, accident_coordinates, marker_color='black')  # Red markers for accidents
    add_markers(my_map, nearby_locations, marker_color='blue')  # Blue markers for arboretums

    # Save the map as an HTML file
    my_map.save('accidents_and_arboretums_map.html')

if __name__ == "__main__":
    main()
