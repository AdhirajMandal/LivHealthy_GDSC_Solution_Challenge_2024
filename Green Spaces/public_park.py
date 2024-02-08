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

def find_nearby_parks(api_key, location, open_now=False):
    gmaps = googlemaps.Client(key=api_key)
    

    params = {
        'location': location,
        'radius': 5000,  # Radius in meters (adjust as needed)
        'open_now': open_now,  # Set to True if you want to find parks that are currently open
        'type': 'park',  # Specify the type as 'park' to filter for public parks
    }
    

    parks_result = gmaps.places_nearby(**params)
    

    nearby_parks = []
    for park in parks_result.get('results', []):
        park_info = {
            'name': park['name'],
            'address': park.get('vicinity', 'N/A'),
            'location': park['geometry']['location'],
        }
        nearby_parks.append(park_info)
    
    return nearby_parks

def main():

    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    

    location = get_current_location()['loc']
    map_center = ((float)(location.split(',')[0]),(float) (location.split(',')[1]))
    

    open_now = False
    
    nearby_parks = find_nearby_parks(api_key, location, open_now)
    
    my_map = folium.Map(location=map_center, zoom_start=14)

    for park in nearby_parks:
        folium.Marker(
            location=[park['location']['lat'], park['location']['lng']],
            popup=f"{park['name']} - {park['address']}",
            icon=folium.Icon(color='green', icon='tree')
        ).add_to(my_map)

    my_map.save('public_parks_map.html')

if __name__ == "__main__":
    main()
