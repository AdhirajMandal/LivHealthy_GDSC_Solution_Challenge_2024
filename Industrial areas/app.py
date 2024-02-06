import requests
import folium

def get_places(api_key, location, radius, keyword):
    base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    params = {
        'location': location,
        'radius': radius,
        'keyword': keyword,
        'key': api_key
    }

    response = requests.get(base_url, params=params)
    results = response.json().get('results', [])

    return results

def mark_danger_zones(api_key, location, radius, industrial_keyword, factory_keyword):
    danger_zones_map = folium.Map(location=[float(coord) for coord in location.split(',')], zoom_start=13)

    industrial_areas = get_places(api_key, location, radius, industrial_keyword)
    factories = get_places(api_key, location, radius, factory_keyword)

    for place in industrial_areas:
        name = place.get('name', 'Unknown')
        geometry = place.get('geometry', {})
        location = geometry.get('location', {})
        lat = location.get('lat', 0.0)
        lng = location.get('lng', 0.0)

        folium.Marker([lat, lng], popup=f"Industrial Area: {name}", icon=folium.Icon(color='red')).add_to(danger_zones_map)

    for place in factories:
        name = place.get('name', 'Unknown')
        geometry = place.get('geometry', {})
        location = geometry.get('location', {})
        lat = location.get('lat', 0.0)
        lng = location.get('lng', 0.0)

        folium.Marker([lat, lng], popup=f"Factory: {name}", icon=folium.Icon(color='red')).add_to(danger_zones_map)

    danger_zones_map.save('danger_zones_map.html')
    danger_zones_map

if __name__ == "__main__":
    # Replace 'YOUR_API_KEY' with your actual Google Places API key
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'

    # Specify the location (latitude and longitude) around which to search for places
    location = '22.594480,88.265690'  # Example location (San Francisco, CA)
    
    # Specify the search radius in meters
    radius = 5000  # Example radius (5000 meters or 5 kilometers)

    # Specify the keywords to search for industrial areas and factories
    industrial_keyword = 'industrial'
    factory_keyword = 'factory'

    mark_danger_zones(api_key, location, radius, industrial_keyword, factory_keyword)
