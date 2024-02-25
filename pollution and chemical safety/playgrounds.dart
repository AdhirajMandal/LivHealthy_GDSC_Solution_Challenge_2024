import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndPlaygroundsMap());
}

class AccidentsAndPlaygroundsMap extends StatefulWidget {
  @override
  _AccidentsAndPlaygroundsMapState createState() => _AccidentsAndPlaygroundsMapState();
}

class _AccidentsAndPlaygroundsMapState extends State<AccidentsAndPlaygroundsMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby playgrounds from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<Map<String, dynamic>> playgrounds = [
      {
        'name': 'Example Playground',
        'address': '123 Example St, City',
        'latitude': 40.7128, // Example playground coordinate
        'longitude': -74.0060,
      },
      // Add more playground data as needed
    ];

    // Add markers for accident coordinates
    for (var accidentCoord in accidentCoordinates) {
      markers.add(
        Marker(
          markerId: MarkerId(accidentCoord.toString()),
          position: accidentCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(title: 'Accident Location'),
        ),
      );
    }

    // Add markers for nearby playgrounds
    for (var playgroundData in playgrounds) {
      LatLng playgroundCoord = LatLng(playgroundData['latitude'], playgroundData['longitude']);
      markers.add(
        Marker(
          markerId: MarkerId(playgroundCoord.toString()),
          position: playgroundCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: playgroundData['name'], snippet: playgroundData['address']),
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Accidents & Playgrounds Map'),
        ),
        body: GoogleMap(
          markers: markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(40.7128, -74.0060), // Initial map center
            zoom: 12,
          ),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
        ),
      ),
    );
  }
}
