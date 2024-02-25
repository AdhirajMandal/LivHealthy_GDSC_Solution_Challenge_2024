import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(AccidentReportingApp());
}

class AccidentReportingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accident Reporting',
      theme: ThemeData(
        primaryColor: Colors.green, // Set background color to green
      ),
      home: ReportAccidentPage(),
    );
  }
}

class ReportAccidentPage extends StatefulWidget {
  @override
  _ReportAccidentPageState createState() => _ReportAccidentPageState();
}

class _ReportAccidentPageState extends State<ReportAccidentPage> {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> submitReport() async {
    final String latitude = latitudeController.text;
    final String longitude = longitudeController.text;
    final String description = descriptionController.text;

    final Map<String, dynamic> reportData = {
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
    };

    final Uri uri = Uri.parse('http://127.0.0.1:5000/report');
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(reportData),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report submitted successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit report'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Accident'),
      ),
      body: Container(
        color: Colors.green, // Set background color to green
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: latitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Latitude'),
            ),
            TextField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Longitude'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitReport,
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
