import googlemaps
from geopy.geocoders import Nominatim
from gmplot import gmplot
import requests

def get_current_location1():
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

def get_current_location():
    try:
        geolocator = Nominatim(user_agent="hospital_locator")
        location = geolocator.geocode("Your Specific Location or Address")
        if location:
            return location.latitude, location.longitude
        else:
            return None
    except Exception as e:
        print(f"Error determining current location: {e}")
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

def plot_google_map(api_key, current_location, hospitals):
    gmap = gmplot.GoogleMapPlotter(current_location[0], current_location[1], 13, apikey=api_key)

    gmap.marker(current_location[0], current_location[1], color='blue', title='Current Location')

    for hospital_data in hospitals:
        lat, lng = hospital_data['geometry']['location']['lat'], hospital_data['geometry']['location']['lng']
        gmap.marker(lat, lng, color='red', title=hospital_data['name'], symbol='+')

    map_filename = "hospital_map.html"
    gmap.draw(map_filename)

    return map_filename

api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'

my_location = get_current_location1()['loc']
current_location = ((float)(my_location.split(',')[0]),(float) (my_location.split(',')[1]))

if current_location:
    radius = 2000
    hospitals_list = get_hospitals(api_key, current_location, radius)

    if hospitals_list:
        map_filename = plot_google_map(api_key, current_location, hospitals_list)

        print(f"Map generated. Opening the map in the default web browser.")
        import webbrowser
        webbrowser.open_new_tab(map_filename)
    else:
        print("No hospitals found nearby.")
else:
    print("Unable to determine current location.")
