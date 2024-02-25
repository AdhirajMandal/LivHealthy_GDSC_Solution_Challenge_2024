import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blue, // Set background color of the page to blue
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionBubble(
                text: 'Environment Testing Plant',
                onPressed: () {
                  // Add functionality to run another Dart program
                  // when this option is clicked
                },
              ),
              OptionBubble(
                text: 'Fire Station',
                onPressed: () {
                  // Add functionality to run another Dart program
                  // when this option is clicked
                },
              ),
              OptionBubble(
                text: 'Public Health Department',
                onPressed: () {
                  // Add functionality to run another Dart program
                  // when this option is clicked
                },
              ),
              OptionBubble(
                text: 'Urgent Care Centre',
                onPressed: () {
                  // Add functionality to run another Dart program
                  // when this option is clicked
                },
              ),
              OptionBubble(
                text: 'Water Plant',
                onPressed: () {
                  // Add functionality to run another Dart program
                  // when this option is clicked
                },
              ),
            ],
          ),
        ),
      ),
    );
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
          primary: Colors.white, // Set the bubble color to white
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
