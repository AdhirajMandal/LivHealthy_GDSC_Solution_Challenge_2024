import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(EmergencyServiceLocator());
}

class EmergencyServiceLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emergency Service Locator'),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionBubble(
                text: 'Environmental Testing Plant',
                onPressed: () {
                  fetchAndDisplayMap('Environmental testing plants');
                },
              ),
              OptionBubble(
                text: 'Fire Station',
                onPressed: () {
                  fetchAndDisplayMap('Fire station');
                },
              ),
              OptionBubble(
                text: 'Public Health Department',
                onPressed: () {
                  fetchAndDisplayMap('Public health department');
                },
              ),
              OptionBubble(
                text: 'Urgent Care Centre',
                onPressed: () {
                  fetchAndDisplayMap('Urgent care center');
                },
              ),
              OptionBubble(
                text: 'Water Plant',
                onPressed: () {
                  fetchAndDisplayMap('Water plant');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchAndDisplayMap(String keyword) async {
    final response = await http.get(Uri.parse(
        'http://localhost:5000/locations?keyword=$keyword')); // Assuming the backend is hosted locally

    if (response.statusCode == 200) {
      final locations = json.decode(response.body)['locations'];
      Navigator.push(
        // Navigate to the map screen
        // Pass the locations retrieved from the backend
        MaterialPageRoute(
          builder: (context) => MapScreen(locations: locations),
        ),
      );
    } else {
      throw Exception('Failed to load locations');
    }
  }
}

class OptionBubble extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionBubble({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  final List<dynamic> locations;

  const MapScreen({required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Service Map'),
        backgroundColor: Colors.blue,
      ),
      body: WebView(
        initialUrl: 'http://localhost:5000/map?locations=$locations', // Assuming the backend serves the map at this URL
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
