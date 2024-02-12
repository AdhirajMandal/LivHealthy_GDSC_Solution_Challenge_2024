import googlemaps
from geopy.geocoders import Nominatim
from gmplot import gmplot
import requests
import firebase_admin
from firebase_admin import credentials, firestore
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

def create_dart_file(api_key, current_location, hospitals, accident_coordinates, map_filename):
    dart_code = """
// Import necessary packages
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hospital and Accident Map'),
        ),
        body: MapScreen(),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Set<Marker> _markers = {};
  GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        _controller = controller;
        _addMarkers();
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(${current_location[0]}, ${current_location[1]}),
        zoom: 13.0,
      ),
      markers: _markers,
    );
  }

  void _addMarkers() {
    _markers.add(Marker(
      markerId: MarkerId('currentLocation'),
      position: LatLng(${current_location[0]}, ${current_location[1]}),
      infoWindow: InfoWindow(
        title: 'Current Location',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    // Add hospital markers
    ${_get_hospital_markers_code(hospitals)}

    // Add accident markers
    ${_get_accident_markers_code(accident_coordinates)}
  }
}

${_get_hospital_markers_code(hospitals)}

${_get_accident_markers_code(accident_coordinates)}
""";

    with open(map_filename, 'w') as dart_file:
        dart_file.write(dart_code)

def _get_hospital_markers_code(hospitals):
    markers_code = ""
    for hospital_data in hospitals:
        lat, lng = hospital_data['geometry']['location']['lat'], hospital_data['geometry']['location']['lng']
        markers_code += f"""
    _markers.add(Marker(
      markerId: MarkerId('{hospital_data['name']}'),
      position: LatLng({lat}, {lng}),
      infoWindow: InfoWindow(
        title: '{hospital_data['name']}',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    """
    return markers_code

def _get_accident_markers_code(accident_coordinates):
    markers_code = ""
    for i, accident_location in enumerate(accident_coordinates):
        lat, lng = accident_location
        markers_code += f"""
    _markers.add(Marker(
      markerId: MarkerId('accidentZone{i}'),
      position: LatLng({lat}, {lng}),
      infoWindow: InfoWindow(
        title: 'Accident Zone',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));
    """
    return markers_code

api_key = 'AIzaSyClYknpllY9faw3p7LbObE2RomXm_8gX2Y'  # Replace with your Google Maps API key

current_location = get_current_location()
if current_location:
    radius = 2000
    hospitals_list = get_hospitals(api_key, current_location, radius)
    accident_coordinates = retrieve_accident_details()

    if hospitals_list or accident_coordinates:
        map_filename = "hospital_accident_map.dart"
        create_dart_file(api_key, current_location, hospitals_list, accident_coordinates, map_filename)

        print(f"Map data has been saved to {map_filename}")
    else:
        print("No hospitals or accident zones found nearby.")
else:
    print("Unable to determine current location.")
