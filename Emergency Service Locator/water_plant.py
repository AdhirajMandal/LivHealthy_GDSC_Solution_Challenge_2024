import googlemaps
import folium
import requests
import firebase_admin
from firebase_admin import credentials, firestore

def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")  # Replace with your Firebase credentials
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})


def retrieve_accident_coordinates():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()

    accident_coordinates = []
    for doc in docs:
        accident_data = doc.to_dict()
        location_info = {
            'latitude': accident_data.get('latitude', 0),
            'longitude': accident_data.get('longitude', 0),
        }
        accident_coordinates.append(location_info)

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

def search_nearby_locations(api_key, location, keyword, radius):
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
        }
        nearby_locations.append(location_info)

    return nearby_locations


def create_map(center_location, zoom_start=14):
    return folium.Map(location=center_location, zoom_start=zoom_start)
def add_markers(map_object, locations, icon_color='blue', popup_text='', icon='info-sign'):
    for location in locations:
        if 'location' in location:
            lat, lng = location['location']['lat'], location['location']['lng']
        elif 'latitude' in location and 'longitude' in location:
            lat, lng = location['latitude'], location['longitude']
        else:
            continue  # Skip invalid location format

        folium.Marker(
            location=[lat, lng],
            popup=f"{location.get('name', '')} - {location.get('address', '')} {popup_text}",
            icon=folium.Icon(color=icon_color, icon=icon)
        ).add_to(map_object)

def main():
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    initialize_firebase()
    accident_coordinates = retrieve_accident_coordinates()  # Add this line

    print(accident_coordinates)  # Add this line to check the structure
    my_location = get_current_location()['loc']
    map_center = ((float)(my_location.split(',')[0]), (float)(my_location.split(',')[1]))

    search_keyword = 'Water treatment plants near me'  # Change this to your desired keyword
    search_radius = 3000

    nearby_locations = search_nearby_locations(api_key, my_location, search_keyword, search_radius)
    print(nearby_locations)
    my_map = create_map(map_center)

    add_markers(my_map, nearby_locations,icon_color='blue', popup_text='Water Treatment Plant')
    add_markers(my_map, accident_coordinates, icon_color='black', popup_text='Accident Area')

    my_map.save('combined_map.html')

if __name__ == "__main__":
    main()


