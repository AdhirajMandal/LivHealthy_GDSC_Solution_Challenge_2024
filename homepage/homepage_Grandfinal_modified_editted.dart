import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LivHealthy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to LivHealthy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Introduction',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to LivHealthy: Your Comprehensive Health and Safety Companion\n\nLivHealthy is your all-in-one solution for promoting health, safety, and well-being in your daily life. With a wide range of features designed to address key areas of concern, LivHealthy empowers you to take control of your health, safety, and environmental impact.\n\nKey Features:\n\n1. Communicable Diseases and Mental Health:\n\nAccess information on common communicable diseases and learn how to prevent and manage them effectively.\nFind support for your mental well-being and discover techniques to reduce stress and enhance mental clarity.\n\n2. Road Safety:\n\nQuickly locate the nearest hospitals and emergency services in case of accidents or emergencies.\nPlan your route with ease and stay updated on weather conditions, school zones, and traffic alerts.\nReport accidents and access safe driving tips to promote awareness and prevent accidents.\nExplore sustainable transportation options for a greener commute.\n\n3. Pollution:\n\nMonitor air quality with real-time AQI updates and locate green spaces to escape pollution.\nIdentify chemical industries and emergency services in your area and access tips for reducing your environmental impact.\nLearn about hazardous chemicals and guidelines for safe handling through educational resources.\n\n4. Dr. Chatbot:\n\nGet personalized health advice and information from our intelligent chatbot, available to assist you 24/7.\n\nWith LivHealthy, you have the tools and resources you need to live a healthier, safer, and more environmentally-conscious life. Join us in creating a better world for ourselves and future generations.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.orange[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fight Communicable Diseases and Mental Health',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Here, you can find information on communicable diseases, prevention tips, and mental health resources.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Increased font size for sub-section text
                    ),
                  ),
                  SizedBox(height: 20),
                  // Grid-style subsections
                  buildSubSectionsGrid(context, [
                    'Information on Communicable Diseases and Prevention Tips',
                    'Mental Health Resources and Support',
                    'Stress Reduction Techniques',
                    'Nearest Hospitals',
                    'Nearest Hospital Route',
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Road Safety',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'These features will help you avoid traffic congestion and prevent road accidents. Find hospitals and navigate to them in case of emergencies.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Increased font size for sub-section text
                    ),
                  ),
                  SizedBox(height: 20),
                  // Grid-style subsections
                  buildSubSectionsGrid(context, [
                    'Nearest Hospitals',
                    'Nearest Hospital Route',
                    'Weather Status',
                    'School Zones',
                    'Safe Driving Tips and Awareness Campaigns',
                    'Information on Sustainable Transportation',
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pollution and Chemical Safety',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stay alert of pollution levels, locate green spaces, and access guidelines for handling hazardous chemicals.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Increased font size for sub-section text
                    ),
                  ),
                  SizedBox(height: 20),
                  // Grid-style subsections
                  buildSubSectionsGrid(context, [
                    'Air Quality Index Mapping',
                    'Chemical Factory Marking',
                    'Emergency Service Locator',
                    'Green Spaces',
                    'Industrial Areas',
                    'Nearest Hospitals',
                    'Nearest Hospitals Route',
                    'Tips for Reducing Personal Environmental Impact',
                    'Guidelines for Handling Hazardous Chemicals and Resources for Chemical Safety Education',
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.purple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chatbot',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Resolve your health issues with personalized advice from our Dr. Chatbot.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Increased font size for sub-section text
                    ),
                  ),
                  SizedBox(height: 20),
                  // Grid-style subsections
                  buildSubSectionsGrid(context, [
                    'Dr. Chatbot',
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conclusion',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'At LivHealthy, our mission is to empower individuals to lead healthier, safer, and more sustainable lives. With a wealth of features aimed at addressing key health, safety, and environmental concerns, LivHealthy is your trusted companion on your journey towards wellness and vitality.\n\nWhether you\'re seeking information on communicable diseases, mental health support, road safety, pollution monitoring, or personalized health advice, LivHealthy has you covered. Our app provides valuable resources, actionable tips, and real-time updates to help you make informed decisions and take proactive steps towards a healthier, safer lifestyle.\n\nJoin our community of health-conscious individuals and together, let\'s make a positive impact on our health, our communities, and our planet. Download LivHealthy today and embark on your path to a brighter, healthier future!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact and Support',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Emails: adhirajmandal321@gmail.com subhadeepdeymds@gmail.com ansrkghamirpur@gmail.com ingle1439@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to LivHealthy!\n\nWe are a team of passionate individuals dedicated to promoting health, safety, and environmental consciousness in our communities. Our app is designed to provide users with comprehensive resources and tools to address key health and safety concerns, from communicable diseases and mental health support to road safety and pollution monitoring.\n\nOur mission is to empower individuals to lead healthier, safer, and more sustainable lives by providing easy access to valuable information, actionable tips, and real-time updates. We strive to create a user-friendly experience that promotes inclusivity, innovation, and personal growth.\n\nWhile we may be newcomers to the field, our enthusiasm and commitment drive us to deliver the best possible experience for our users. We value your feedback and invite you to join us on this exciting journey towards a brighter, healthier future.\n\nDevelopers: Adhiraj Mandal, Subhadeep Dey, Anshika Gupta, Payal, are currently pursuing B.Tech (engineering) at Indian Institute of Engineering Science and Technology, Shibpur.\n\nThank you for choosing LivHealthy!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build grid-style subsections
  Widget buildSubSectionsGrid(BuildContext context, List<String> subSections) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: subSections.map((String subSection) {
        return ElevatedButton(
          onPressed: () {
            // Handle navigation to selected sub-section
            handleNavigation(context, subSection);
          },
          child: Text(
            subSection,
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }

  // Method to handle navigation based on selected sub-section
  void handleNavigation(BuildContext context, String selectedSubSection) {
    // Implement navigation logic based on the selected sub-section
    switch (selectedSubSection) {
      case 'Information on Communicable Diseases and Prevention Tips':
        // Navigate to PDF file or Dart program for Information on Communicable Diseases
        break;
      case 'Mental Health Resources and Support':
        // Navigate to PDF file or Dart program for Mental Health Resources and Support
        break;
      case 'Stress Reduction Techniques':
        // Navigate to PDF file or Dart program for Stress Reduction Techniques
        break;
      case 'Nearest Hospitals':
        // Navigate to Dart program for Nearest Hospitals
        break;
      case 'Nearest Hospital Route':
        // Navigate to Dart program for Nearest Hospital Route
        break;
      case 'Weather Status':
        // Navigate to Dart program for Weather Status
        break;
      case 'School Zones':
        // Navigate to Dart program for School Zones
        break;
      case 'Safe Driving Tips and Awareness Campaigns':
        // Navigate to PDF file or Dart program for Safe Driving Tips and Awareness Campaigns
        break;
      case 'Information on Sustainable Transportation':
        // Navigate to PDF file or Dart program for Information on Sustainable Transportation
        break;
      // Add more cases for other sub-sections as needed
    }
  }
}
