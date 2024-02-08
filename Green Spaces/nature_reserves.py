import googlemaps
import folium
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
        }
        nearby_locations.append(location_info)
    
    return nearby_locations

def create_map(center_location, zoom_start=14):

    return folium.Map(location=center_location, zoom_start=zoom_start)

def add_markers(map_object, locations):

    for location in locations:
        folium.Marker(
            location=[location['location']['lat'], location['location']['lng']],
            popup=f"{location['name']} - {location['address']}",
            icon=folium.Icon(color='blue', icon='info-sign')
        ).add_to(map_object)

def main():
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    
    my_location = get_current_location()['loc']
    map_center = ((float)(my_location.split(',')[0]),(float) (my_location.split(',')[1]))
    
    search_keyword = 'nature preserve'  # Change this to your desired keyword
    

    search_radius = 5000
    
    nearby_locations = search_nearby_locations(api_key, my_location, search_keyword, search_radius)
   
    my_map = create_map(map_center)
 
    add_markers(my_map, nearby_locations)
  
    my_map.save('nearby_locations_map.html')

if __name__ == "__main__":
    main()
