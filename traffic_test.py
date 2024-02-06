import requests

def get_nearest_hospital(api_key, location):
    url = f'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={location}&rankby=distance&type=hospital&key={api_key}'
    response = requests.get(url)
    data = response.json()
    if 'results' in data:
        if data['results']:
            nearest_hospital_location = data['results'][0]['geometry']['location']
            return nearest_hospital_location
    return None

def get_traffic_conditions(api_key, location):
    base_url = 'https://roads.googleapis.com/v1/snapToRoads'
    api_url = f'{base_url}?path={location}&interpolate=true&key={api_key}'

    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for HTTP errors

        data = response.json()

        if 'snappedPoints' in data:
            for point in data['snappedPoints']:
                print(f"Location: {point['location']}")
                print(f"Original Index: {point['originalIndex']}")
                print(f"Place ID: {point['placeId']}")
                print(f"Road Type: {point['placeId']}")

                if 'metadata' in point and 'roadInfo' in point['metadata']:
                    traffic_info = point['metadata']['roadInfo']
                    print(f"Traffic Condition: {traffic_info.get('currentSpeedKmph', 'N/A')} km/h")
                else:
                    print("Traffic Condition: N/A")

                print("-------------")

        else:
            print(f"Error: No snapped points in the response.")

    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'
    location = '22.594480,88.265690'  # Replace with the desired location (latitude, longitude)
    nearest_hospital_location = get_nearest_hospital(api_key, location)
    if nearest_hospital_location:
        nearest_hospital_location_str = f"{nearest_hospital_location['lat']},{nearest_hospital_location['lng']}"
        print(f"Nearest Hospital Location: {nearest_hospital_location_str}")
        get_traffic_conditions(api_key, nearest_hospital_location_str)
    else:
        print("Error: No hospitals found nearby.")
