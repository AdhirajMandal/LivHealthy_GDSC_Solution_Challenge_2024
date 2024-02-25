import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndWildlifeSanctuariesMap());
}

class AccidentsAndWildlifeSanctuariesMap extends StatefulWidget {
  @override
  _AccidentsAndWildlifeSanctuariesMapState createState() =>
      _AccidentsAndWildlifeSanctuariesMapState();
}

class _AccidentsAndWildlifeSanctuariesMapState
    extends State<AccidentsAndWildlifeSanctuariesMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby wildlife sanctuaries from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<Map<String, dynamic>> wildlifeSanctuaries = [
      {
        'name': 'Example Sanctuary',
        'address': '123 Example St, City',
        'latitude': 40.7128, // Example sanctuary coordinate
        'longitude': -74.0060,
      },
      // Add more wildlife sanctuary data as needed
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

    // Add markers for nearby wildlife sanctuaries
    for (var sanctuaryData in wildlifeSanctuaries) {
      LatLng sanctuaryCoord =
          LatLng(sanctuaryData['latitude'], sanctuaryData['longitude']);
      markers.add(
        Marker(
          markerId: MarkerId(sanctuaryCoord.toString()),
          position: sanctuaryCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(
              title: sanctuaryData['name'], snippet: sanctuaryData['address']),
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
          title: Text('Accidents & Wildlife Sanctuaries Map'),
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
