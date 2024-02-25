import 'package:flutter/material.dart';

void main() {
  runApp(GreenSpacesApp());
}

class GreenSpacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Spaces',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GreenSpacesHomePage(),
    );
  }
}

class GreenSpacesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Spaces'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GreenSpaceOption(
                      text: 'Arboretums',
                      onTap: () {
                        // Implement action for Arboretums option
                        print('Navigate to Arboretums page');
                      },
                    ),
                    GreenSpaceOption(
                      text: 'Botanical Garden',
                      onTap: () {
                        // Implement action for Botanical Garden option
                        print('Navigate to Botanical Garden page');
                      },
                    ),
                    GreenSpaceOption(
                      text: 'Nature Reserves',
                      onTap: () {
                        // Implement action for Nature Reserves option
                        print('Navigate to Nature Reserves page');
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    GreenSpaceOption(
                      text: 'Playgrounds',
                      onTap: () {
                        // Implement action for Playgrounds option
                        print('Navigate to Playgrounds page');
                      },
                    ),
                    GreenSpaceOption(
                      text: 'Public Parks',
                      onTap: () {
                        // Implement action for Public Parks option
                        print('Navigate to Public Parks page');
                      },
                    ),
                    GreenSpaceOption(
                      text: 'Urban Greenways',
                      onTap: () {
                        // Implement action for Urban Greenways option
                        print('Navigate to Urban Greenways page');
                      },
                    ),
                    GreenSpaceOption(
                      text: 'Wildlife Sanctuaries',
                      onTap: () {
                        // Implement action for Wildlife Sanctuaries option
                        print('Navigate to Wildlife Sanctuaries page');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GreenSpaceOption extends StatelessWidget {
  final String text;
  final Function onTap;

  const GreenSpaceOption({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(30), // Increased padding to make bubbles bigger
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
