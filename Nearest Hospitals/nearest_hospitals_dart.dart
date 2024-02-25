import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital and Accident Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HospitalAccidentMap(),
    );
  }
}

class HospitalAccidentMap extends StatefulWidget {
  @override
  _HospitalAccidentMapState createState() => _HospitalAccidentMapState();
}

class _HospitalAccidentMapState extends State<HospitalAccidentMap> {
  String mapUrl = '';

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
  }

  void fetchDataFromBackend() async {
    var url = Uri.parse('http://localhost:5000/data'); // Replace with backend URL
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        mapUrl = data['mapUrl'];
      });
    } else {
      print('Failed to fetch data from backend. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital and Accident Map'),
      ),
      body: Center(
        child: mapUrl.isNotEmpty
            ? ElevatedButton(
                onPressed: () {
                  // Open the map URL in the default web browser
                  // Note: This will not work in web or iOS due to security restrictions
                  // For web or iOS, you would need to use a WebView widget to display the map
                  launchURL(mapUrl);
                },
                child: Text('View Map'),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
