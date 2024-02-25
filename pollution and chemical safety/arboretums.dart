import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AccidentsAndArboretumsMap());
}

class AccidentsAndArboretumsMap extends StatefulWidget {
  @override
  _AccidentsAndArboretumsMapState createState() => _AccidentsAndArboretumsMapState();
}

class _AccidentsAndArboretumsMapState extends State<AccidentsAndArboretumsMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and display data
    fetchAndDisplayData();
  }

  void fetchAndDisplayData() async {
    // Simulate fetching accident coordinates and nearby arboretums from backend
    List<LatLng> accidentCoordinates = [
      LatLng(40.7128, -74.0060), // Example accident coordinate
      // Add more accident coordinates as needed
    ];
    List<LatLng> arboretumCoordinates = [
      LatLng(40.7128, -74.0060), // Example arboretum coordinate
      // Add more arboretum coordinates as needed
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

    // Add markers for nearby arboretums
    for (var arboretumCoord in arboretumCoordinates) {
      markers.add(
        Marker(
          markerId: MarkerId(arboretumCoord.toString()),
          position: arboretumCoord,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: 'Arboretum'),
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
          title: Text('Accidents & Arboretums Map'),
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
