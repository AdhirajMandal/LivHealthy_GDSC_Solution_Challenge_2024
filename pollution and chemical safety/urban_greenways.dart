import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndUrbanGreenwaysMap());
}

class AccidentsAndUrbanGreenwaysMap extends StatefulWidget {
  @override
  _AccidentsAndUrbanGreenwaysMapState createState() => _AccidentsAndUrbanGreenwaysMapState();
}

class _AccidentsAndUrbanGreenwaysMapState extends State<AccidentsAndUrbanGreenwaysMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby urban greenways from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<Map<String, dynamic>> urbanGreenways = [
      {
        'name': 'Example Greenway',
        'address': '123 Example St, City',
        'latitude': 40.7128, // Example greenway coordinate
        'longitude': -74.0060,
      },
      // Add more urban greenway data as needed
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

    // Add markers for nearby urban greenways
    for (var greenwayData in urbanGreenways) {
      LatLng greenwayCoord = LatLng(greenwayData['latitude'], greenwayData['longitude']);
      markers.add(
        Marker(
          markerId: MarkerId(greenwayCoord.toString()),
          position: greenwayCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: greenwayData['name'], snippet: greenwayData['address']),
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
          title: Text('Accidents & Urban Greenways Map'),
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
