import googlemaps
import folium
from datetime import datetime

# Replace 'YOUR_API_KEY' with your actual Google Cloud API key
API_KEY = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
gmaps = googlemaps.Client(key=API_KEY)

def get_education_institutes_locations():
    # You may need to adjust the search query based on the type of education institutes you are interested in.
    # Here, it searches for places with the keyword 'school'.
    places_result = gmaps.places(query='school | institute', location=(latitude, longitude), radius=5000)

    education_institutes = []
    for place in places_result['results']:
        location = place['geometry']['location']
        education_institutes.append((location['lat'], location['lng']))

    return education_institutes

def mark_slow_driving_areas(locations):
    slow_driving_speed = 30  # Adjust as needed

    for location in locations:
        roads_result = gmaps.nearest_roads([location])
        if roads_result and 'snappedPoints' in roads_result:
            snapped_point = roads_result['snappedPoints'][0]
            place_id = snapped_point.get('placeId', None)

            if place_id:
                gmaps.speed_limits(place_id=place_id, start_time=datetime.now(), speed_limit=slow_driving_speed)

def display_on_map(locations):
    map_center = locations[0]  # Center the map on the first location

    my_map = folium.Map(location=map_center, zoom_start=14)

    for location in locations:
        folium.Marker(location=location, popup="Education Institute").add_to(my_map)

    my_map.save("education_institutes_map.html")
    print("Map saved as education_institutes_map.html")

if __name__ == "__main__":
    # Replace with the coordinates of the area you want to search within
    latitude = 22.594480
    longitude = 88.265690

    education_institutes_locations = get_education_institutes_locations()
    mark_slow_driving_areas(education_institutes_locations)
    display_on_map(education_institutes_locations)
