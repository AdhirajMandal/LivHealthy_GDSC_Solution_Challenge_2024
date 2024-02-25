import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chemical Storage and Accident Map',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chemical Storage and Accident Map'),
        ),
        body: MapView(),
      ),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final String _mapUrl = 'assets/combined_map.html'; // Path to your HTML map file

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _mapUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
