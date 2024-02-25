import 'package:flutter/material.dart';

void main() {
  runApp(DrChatBotApp());
}

class DrChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. ChatBot',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DrChatBotScreen(),
    );
  }
}

class DrChatBotScreen extends StatefulWidget {
  @override
  _DrChatBotScreenState createState() => _DrChatBotScreenState();
}

class _DrChatBotScreenState extends State<DrChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  List<String> _messages = [
    'Dr. Chatbot: Your name?',
    'You: Adhiraj',
    'Dr. Chatbot: Hello, Adhiraj',
    'Dr. Chatbot: Enter the symptom you are experiencing',
    'You: Fever',
    'Dr. Chatbot: Okay, from how many days?',
    'You: 5',
    'Dr. Chatbot: Are you experiencing any vomiting?',
    'You: Yes',
    'Dr. Chatbot: Cough?',
    'You: No',
    'Dr. Chatbot: Neck pain?',
    'You: No',
    'Dr. Chatbot: Headache?',
    'You: No',
    'Dr. Chatbot: Chills?',
    'You: Yes',
    'Dr. Chatbot: Fatigue?',
    'You: Yes',
    'Dr. Chatbot: Nausea?',
    'You: Yes',
    'Dr. Chatbot: Itching?',
    'You: Yes',
    'Dr. Chatbot: Abdominal pain?',
    'You: Yes',
    'Dr. Chatbot: Yellowish skin?',
    'You: Yes',
    'Dr. Chatbot: It might not be that bad but you should take precautions. you may have jaundice. Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the "morbus regius" (the regal disease) in the belief that only the touch of a king could cure it. take following measures:',
    '1) Drink plenty of water.',
    '2) Consume milk thistle',
    '3) Eat fruits and high fiberous food.',
    '4) Medication.',
  ];

  void _handleSubmitted(String text) {
    setState(() {
      _messages.add('You: $text');
    });
    if (text.toLowerCase() == 'fever') {
      setState(() {
        _messages.add('Dr. Chatbot: Hello, Adhiraj');
        _messages.add('Dr. Chatbot: Enter the symptom you are experiencing');
      });
    } else if (text.toLowerCase() == '5') {
      setState(() {
        _messages.add('Dr. Chatbot: Are you experiencing any vomiting?');
      });
    } else if (text.toLowerCase() == 'yes') {
      setState(() {
        _messages.add('Dr. Chatbot: Cough?');
      });
    } else if (text.toLowerCase() == 'no') {
      setState(() {
        _messages.add('Dr. Chatbot: Neck pain?');
      });
    } else if (text.toLowerCase() == 'chills') {
      setState(() {
        _messages.add('Dr. Chatbot: Fatigue?');
      });
    } else if (text.toLowerCase() == 'nausea') {
      setState(() {
        _messages.add('Dr. Chatbot: Itching?');
      });
    } else if (text.toLowerCase() == 'abdominal pain') {
      setState(() {
        _messages.add('Dr. Chatbot: Yellowish skin?');
      });
    } else if (text.toLowerCase() == 'yes') {
      setState(() {
        _messages.add('Dr. Chatbot: Headache?');
      });
    } else if (text.toLowerCase() == 'yes') {
      setState(() {
        _messages.add('Dr. Chatbot: Yellowish skin?');
      });
    } else if (text.toLowerCase() == 'yes') {
      setState(() {
        _messages.add(
            'Dr. Chatbot: It might not be that bad but you should take precautions. you may have jaundice. Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the "morbus regius" (the regal disease) in the belief that only the touch of a king could cure it. take following measures:');
        _messages.add('1) Drink plenty of water.');
        _messages.add('2) Consume milk thistle.');
        _messages.add('3) Eat fruits and high fiberous food.');
        _messages.add('4) Medication.');
      });
    }
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr. ChatBot'),
      ),
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Text(
                    _messages[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
                      hintText: 'Send a message',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: () => _handleSubmitted(_textController.text),
                  child: Icon(Icons.send),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
