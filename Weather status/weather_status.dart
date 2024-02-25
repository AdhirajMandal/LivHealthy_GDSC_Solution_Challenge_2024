import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Map',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Map'),
        ),
        body: Center(
          child: WeatherMap(),
        ),
      ),
    );
  }
}

class WeatherMap extends StatefulWidget {
  @override
  _WeatherMapState createState() => _WeatherMapState();
}

class _WeatherMapState extends State<WeatherMap> {
  final String _mapUrl = 'http://localhost:8000/weather_map.html';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _mapUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
