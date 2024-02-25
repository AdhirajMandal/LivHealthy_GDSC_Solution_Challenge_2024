import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education & Accident Map',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Education & Accident Map'),
        ),
        body: Center(
          child: AccidentEducationMap(),
        ),
      ),
    );
  }
}

class AccidentEducationMap extends StatefulWidget {
  @override
  _AccidentEducationMapState createState() => _AccidentEducationMapState();
}

class _AccidentEducationMapState extends State<AccidentEducationMap> {
  final String _mapUrl = 'http://localhost:8000/education_accident_map.html';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _mapUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
