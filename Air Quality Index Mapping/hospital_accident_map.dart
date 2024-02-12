
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
