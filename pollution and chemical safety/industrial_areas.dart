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
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final String pythonApiUrl = 'http://localhost:5000'; // Change URL accordingly

  Future<List<dynamic>> fetchDangerZones() async {
    final response = await http.get(Uri.parse('$pythonApiUrl/danger_zones'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['danger_zones'];
    } else {
      throw Exception('Failed to load danger zones');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danger Zones Map'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: fetchDangerZones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return WebView(
              initialUrl: Uri.dataFromString(
                '''
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

                        var dangerZones = ${jsonEncode(snapshot.data)};
                        for (var i = 0; i < dangerZones.length; i++) {
                          var zone = dangerZones[i];
                          var marker = new google.maps.Marker({
                            position: {lat: zone['latitude'], lng: zone['longitude']},
                            map: map,
                            title: zone['name'],
                            icon: {
                              url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png'
                            },
                          });
                        }
                      }
                    </script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
                  </body>
                </html>
                ''',
                mimeType: 'text/html',
              ).toString(),
              javascriptMode: JavascriptMode.unrestricted,
            );
          }
        },
      ),
    );
  }
}
