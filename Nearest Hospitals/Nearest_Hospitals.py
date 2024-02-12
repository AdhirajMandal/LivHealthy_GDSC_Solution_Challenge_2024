import googlemaps
from geopy.geocoders import Nominatim
from gmplot import gmplot
import requests
import firebase_admin
from firebase_admin import credentials, firestore
import webbrowser
import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
firebase_admin.initialize_app(cred)

def get_current_location():
    try:
        response = requests.get('https://ipinfo.io/json')
        
        if response.status_code == 200:
            data = response.json()
            loc = data.get('loc', 'N/A')  # Latitude and longitude
            if loc:
                return tuple(map(float, loc.split(',')))
            else:
                print("Error: Latitude and longitude not found in response.")
                return None
        else:
            print(f"Error: Unable to fetch location. Status Code: {response.status_code}")
            return None
    except Exception as e:
        print(f"Error: {e}")
        return None

def get_hospitals(api_key, location, radius):
    gmaps = googlemaps.Client(key=api_key)
    places_result = gmaps.places_nearby(
        location=location,
        radius=radius,
        type='hospital'  # Filter by hospital types
    )
    hospitals = []
    if 'results' in places_result:
        hospitals = places_result['results']
    return hospitals

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

def plot_google_map(api_key, current_location, hospitals, accident_coordinates):
    gmap = gmplot.GoogleMapPlotter(current_location[0], current_location[1], 13, apikey=api_key)

    # Mark current location
    gmap.marker(current_location[0], current_location[1], color='blue', title='Current Location')

    # Mark hospitals
    for hospital_data in hospitals:
        lat, lng = hospital_data['geometry']['location']['lat'], hospital_data['geometry']['location']['lng']
        gmap.marker(lat, lng, color='red', title=hospital_data['name'], symbol='+')

    # Mark accident coordinates
    for accident_location in accident_coordinates:
        lat, lng = accident_location
        gmap.marker(lat, lng, color='orange', title='Accident Zone', symbol='o')

    map_filename = "hospital_accident_map.html"
    gmap.draw(map_filename)

    return map_filename

api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'  # Replace with your Google Maps API key

current_location = get_current_location()
if current_location:
    radius = 2000
    hospitals_list = get_hospitals(api_key, current_location, radius)
    accident_coordinates = retrieve_accident_details()

    if hospitals_list or accident_coordinates:
        map_filename = plot_google_map(api_key, current_location, hospitals_list, accident_coordinates)

        import webbrowser
        webbrowser.open_new_tab(map_filename)
    else:
        print("No hospitals or accident zones found nearby.")
else:
    print("Unable to determine current location.")
