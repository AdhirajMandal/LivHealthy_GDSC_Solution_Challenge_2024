import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndBotanicalGardensMap());
}

class AccidentsAndBotanicalGardensMap extends StatefulWidget {
  @override
  _AccidentsAndBotanicalGardensMapState createState() => _AccidentsAndBotanicalGardensMapState();
}

class _AccidentsAndBotanicalGardensMapState extends State<AccidentsAndBotanicalGardensMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby botanical gardens from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<Map<String, dynamic>> botanicalGardens = [
      {
        'name': 'Example Botanical Garden',
        'address': '123 Example St, City',
        'latitude': 40.7128, // Example botanical garden coordinate
        'longitude': -74.0060,
      },
      // Add more botanical garden data as needed
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

    // Add markers for nearby botanical gardens
    for (var gardenData in botanicalGardens) {
      LatLng gardenCoord = LatLng(gardenData['latitude'], gardenData['longitude']);
      markers.add(
        Marker(
          markerId: MarkerId(gardenCoord.toString()),
          position: gardenCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: gardenData['name'], snippet: gardenData['address']),
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
          title: Text('Accidents & Botanical Gardens Map'),
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
