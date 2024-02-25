import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String pythonApiUrl = 'http://localhost:5000'; // Change URL accordingly

  Future<List<dynamic>> fetchLocations(String keyword) async {
    final response = await http.get(Uri.parse('$pythonApiUrl/locations?keyword=$keyword'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['locations'];
    } else {
      throw Exception('Failed to load locations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Service Locator'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton(
              text: 'Accident Areas',
              onPressed: () async {
                List<dynamic> accidentAreas = await fetchLocations('accident_area');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen(locations: accidentAreas)),
                );
              },
            ),
            OptionButton(
              text: 'Water Treatment Plants',
              onPressed: () async {
                List<dynamic> waterTreatmentPlants = await fetchLocations('water_treatment_plant');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen(locations: waterTreatmentPlants)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  final List<dynamic> locations;

  MapScreen({required this.locations});

  @override
  Widget build(BuildContext context) {
    String htmlContent = '''
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          #map {
            height: 100%;
            width: 100%;
          }
        </style>
      </head>
      <body>
        <div id="map"></div>
        <script>
          function initMap() {
            var map = new google.maps.Map(document.getElementById("map"), {
              zoom: 12,
              center: {lat: 0, lng: 0},
            });

            var locations = $locations;
            for (var i = 0; i < locations.length; i++) {
              var location = locations[i];
              var marker = new google.maps.Marker({
                position: {lat: location['latitude'], lng: location['longitude']},
                map: map,
                title: location['name'],
              });
            }
          }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
      </body>
    </html>
    ''';

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.blue,
      ),
      body: WebView(
        initialUrl: Uri.dataFromString(htmlContent, mimeType: 'text/html').toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
