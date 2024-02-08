import requests
import folium
import polyline

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

def find_nearby_hospitals(api_key, latitude, longitude, radius=5000, types='hospital'):
    base_url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
    params = {
        'location': f'{latitude},{longitude}',
        'radius': radius,
        'types': types,
        'key': api_key
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    if response.status_code == 200 and data.get('status') == 'OK':
        hospitals = data.get('results', [])
        return hospitals
    else:
        print(f"Error: {data.get('status', 'Unknown error')}")
        return None

def print_hospitals(hospitals):
    if hospitals:
        print("Nearby Hospitals:")
        for idx, hospital in enumerate(hospitals, start=1):
            name = hospital.get('name', 'N/A')
            vicinity = hospital.get('vicinity', 'N/A')
            print(f"{idx}. {name} - {vicinity}")
    else:
        print("No hospitals found.")

def mark_on_map(map_object, latitude, longitude, popup_text):
    folium.Marker([latitude, longitude], popup=popup_text).add_to(map_object)

def get_route(api_key, origin, destination):
    base_url = 'https://maps.googleapis.com/maps/api/directions/json'
    params = {
        'origin': origin,
        'destination': destination,
        'key': api_key
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    if response.status_code == 200 and data.get('status') == 'OK':
        return data.get('routes', [])[0]['overview_polyline']['points']
    else:
        print(f"Error: {data.get('status', 'Unknown error')}")
        return None

if __name__ == "__main__":
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'

    my_location = get_current_location()['loc']
    origin_latitude = (float)(my_location.split(',')[0])
    origin_longitude = (float) (my_location.split(',')[1])
    
    radius = 5000

    hospitals = find_nearby_hospitals(api_key, origin_latitude, origin_longitude, radius)
    print_hospitals(hospitals)

    hospital_map = folium.Map(location=[origin_latitude, origin_longitude], zoom_start=13)

    if hospitals:
        first_hospital = hospitals[0]
        hospital_name = first_hospital.get('name', 'N/A')
        hospital_vicinity = first_hospital.get('vicinity', 'N/A')
        popup_text = f"{hospital_name}\n{hospital_vicinity}"
        mark_on_map(hospital_map, first_hospital['geometry']['location']['lat'], first_hospital['geometry']['location']['lng'], popup_text)

        destination_latitude = first_hospital['geometry']['location']['lat']
        destination_longitude = first_hospital['geometry']['location']['lng']
        route_coordinates = get_route(api_key, f'{origin_latitude},{origin_longitude}', f'{destination_latitude},{destination_longitude}')

        decoded_route = polyline.decode(route_coordinates)
        folium.PolyLine(locations=decoded_route, color='blue').add_to(hospital_map)

    hospital_map.save("hospital_route_map.html")
