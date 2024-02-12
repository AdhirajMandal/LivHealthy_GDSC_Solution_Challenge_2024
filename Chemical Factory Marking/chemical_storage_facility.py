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

def retrieve_accident_details():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()
    accident_locations = []

    for doc in docs:
        accident_data = doc.to_dict()
        accident_locations.append({
            'name': 'Accident Area',
            'location': [float(accident_data['latitude']), float(accident_data['longitude'])],
            'popup': 'Accident Area'
        })

    return accident_locations

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
            'location': place['geometry']['location'],
            'popup': f"{place['name']} - {place.get('vicinity', 'N/A')}"
        }
        nearby_locations.append(location_info)

    return nearby_locations

def create_map(center_location, zoom_start=14):
    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations,icon,colour):
    for location in locations:
        print(location)
        if 'lat' in location['location'] and 'lng' in location['location']:
            lat, lng = location['location']['lat'], location['location']['lng']
        elif isinstance(location['location'], (list, tuple)):
            lat, lng = location['location'][0], location['location'][1]
        else:
            raise ValueError(f"Invalid location format: {location['location']}")

        folium.Marker(
            location=[lat, lng],
            popup=location['popup'],
            icon=folium.Icon(color=colour, icon=icon)
        ).add_to(map_object)


def main():
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    initialize_firebase()
    
    # Retrieve accident details from Firebase
    accident_locations = retrieve_accident_details()

    # Retrieve current location
    my_location = get_current_location()['loc']
    map_center = (float(my_location.split(',')[0]), float(my_location.split(',')[1]))

    # Search for chemical storage facilities
    search_keyword = 'chemical storage facilities near me'
    search_radius = 4000
    chemical_locations = search_nearby_locations(api_key, my_location, search_keyword, search_radius)
    print

    # Create a Folium map centered around the current location
    my_map = create_map(map_center)

    # Add markers for chemical storage facilities and accident areas
    add_markers(my_map, chemical_locations,'info-sign','blue')
    add_markers(my_map, accident_locations,'solid','black')

    # Save the map as an HTML file
    my_map.save('combined_map.html')

if __name__ == "__main__":
    main()
