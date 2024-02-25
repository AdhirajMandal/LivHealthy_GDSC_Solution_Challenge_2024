import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndPublicParksMap());
}

class AccidentsAndPublicParksMap extends StatefulWidget {
  @override
  _AccidentsAndPublicParksMapState createState() => _AccidentsAndPublicParksMapState();
}

class _AccidentsAndPublicParksMapState extends State<AccidentsAndPublicParksMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby public parks from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<Map<String, dynamic>> publicParks = [
      {
        'name': 'Example Park',
        'address': '123 Example St, City',
        'latitude': 40.7128, // Example park coordinate
        'longitude': -74.0060,
      },
      // Add more public park data as needed
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

    // Add markers for nearby public parks
    for (var parkData in publicParks) {
      LatLng parkCoord = LatLng(parkData['latitude'], parkData['longitude']);
      markers.add(
        Marker(
          markerId: MarkerId(parkCoord.toString()),
          position: parkCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: parkData['name'], snippet: parkData['address']),
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
          title: Text('Accidents & Public Parks Map'),
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
