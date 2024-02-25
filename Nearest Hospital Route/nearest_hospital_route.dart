import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital and Accident Route Map',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hospital and Accident Route Map'),
        ),
        body: Center(
          child: HospitalAccidentMap(),
        ),
      ),
    );
  }
}

class HospitalAccidentMap extends StatefulWidget {
  @override
  _HospitalAccidentMapState createState() => _HospitalAccidentMapState();
}

class _HospitalAccidentMapState extends State<HospitalAccidentMap> {
  final String _mapUrl = 'http://localhost:8000/hospital_accident_route_map.html';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _mapUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
