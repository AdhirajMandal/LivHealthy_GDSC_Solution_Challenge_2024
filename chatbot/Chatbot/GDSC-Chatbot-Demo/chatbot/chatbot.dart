import 'package:flutter/material.dart';

void main() {
  runApp(ChatBotApp());
}

class ChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBot',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    // Handle user input and interaction with the backend Python program
    print('User Input: $text');
    // Add your logic to interact with the backend here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Chat messages will be displayed here
                  // You can use a ListView.builder to display messages dynamically
                ],
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
