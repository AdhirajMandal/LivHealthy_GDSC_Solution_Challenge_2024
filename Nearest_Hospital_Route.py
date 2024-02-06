import googlemaps
from geopy.geocoders import Nominatim
from gmplot import gmplot

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

    # Mark current location with a blue symbol
    gmap.marker(current_location[0], current_location[1], color='blue', title='Current Location')

    # Mark hospitals with a custom symbol (e.g., '+') in red
    for hospital_data in hospitals:
        lat, lng = hospital_data['geometry']['location']['lat'], hospital_data['geometry']['location']['lng']
        gmap.marker(lat, lng, color='red', title=hospital_data['name'], symbol='+')

    # Draw the map
    map_filename = "hospital_map.html"
    gmap.draw(map_filename)

    return map_filename

# Replace 'your_api_key' with your actual Google Maps API key
api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'

# Hardcoded current location for demonstration
current_location = (22.652821, 88.351120)

if current_location:
    radius = 500
    hospitals_list = get_hospitals(api_key, current_location, radius)

    if hospitals_list:
        # Plot the map with hospitals using custom symbols
        map_filename = plot_google_map(api_key, current_location, hospitals_list)

        print(f"Map generated. Opening the map in the default web browser.")
        # Open the generated HTML file in the default web browser
        import webbrowser
        webbrowser.open_new_tab(map_filename)
    else:
        print("No hospitals found nearby.")
else:
    print("Unable to determine current location.")
