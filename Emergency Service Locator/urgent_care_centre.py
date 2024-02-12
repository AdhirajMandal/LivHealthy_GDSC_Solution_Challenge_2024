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

def retrieve_urgent_care_coordinates():
    db = firestore.client()
    urgent_care_ref = db.collection("accidents")
    docs = urgent_care_ref.stream()

    urgent_care_coordinates = []
    for doc in docs:
        urgent_care_data = doc.to_dict()
        urgent_care_coordinates.append({
            'latitude': float(urgent_care_data['latitude']),
            'longitude': float(urgent_care_data['longitude']),
            'type': 'accident',  # Adding a type to differentiate urgent care center coordinates
        })

    return urgent_care_coordinates

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
            'type': 'urgent_care',  # Adding a type to differentiate urgent care center coordinates
        }
        nearby_locations.append(location_info)

    return nearby_locations

def create_map(center_location, zoom_start=14):
    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations,colour):
    for location in locations:
        if 'location' in location:
            lat, lng = location['location']['lat'], location['location']['lng']
            name = location['name']
            address = location.get('address', '')
            type_marker = location.get('type', '')
        elif 'latitude' in location and 'longitude' in location:
            lat, lng = location['latitude'], location['longitude']
            name = 'Accident Zone'
            address = ''
            type_marker = 'accident_zone'
        else:
            raise ValueError(f"Invalid location format: {location}")

        icon_color = 'blue' if type_marker == 'urgent_care' else 'red'
        popup_text = f"{name} - {address}"
        folium.Marker(
            location=[lat, lng],
            popup=popup_text,
            icon=folium.Icon(color=colour, icon='info-sign')
        ).add_to(map_object)

def main():
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    initialize_firebase()

    # Retrieve urgent care coordinates from Firebase
    urgent_care_coordinates = retrieve_urgent_care_coordinates()

    # Retrieve current location
    location_data = get_current_location()
    if location_data is None:
        print("Unable to fetch current location.")
        return

    latitude = float(location_data['loc'].split(',')[0])
    longitude = float(location_data['loc'].split(',')[1])

    # Retrieve nearby urgent care center locations
    search_keyword = 'Urgent care center near me'
    search_radius = 2000
    nearby_locations = search_nearby_locations(api_key, f"{latitude},{longitude}", search_keyword, search_radius)

    # Create Folium map
    map_center = [latitude, longitude]
    my_map = create_map(map_center, zoom_start=12)

    # Add markers for urgent care center coordinates and nearby urgent care center locations
    add_markers(my_map, urgent_care_coordinates,'black')
    add_markers(my_map, nearby_locations,'blue')

    my_map.save('combined_map_urgent_care.html')
    print("Map saved to 'combined_map_urgent_care.html'")

if __name__ == "__main__":
    main()
