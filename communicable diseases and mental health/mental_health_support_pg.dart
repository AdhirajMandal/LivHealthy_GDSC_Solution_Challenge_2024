import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textual Article Viewer',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange, // Set orange background color
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      home: TextualArticlePage(),
    );
  }
}

class TextualArticlePage extends StatelessWidget {
  final String textualArticle = """
National Suicide Prevention Lifeline (988): If you or someone you know is at 
immediate risk of self-harm, suicide, or hurting others, you can call or text the 
988 Suicide and Crisis Lifeline. Trained crisis counselors are available 24/7 to 
provide help and support. For those who are hard of hearing, they can use their 
preferred relay service or dial 711 followed by 9881.

1. SAMHSA’s National Helpline (800-662-HELP): The Substance Abuse 
and Mental Health Services Administration (SAMHSA) offers a national 
helpline for mental health support. 

2. Online Resources:
○ FindSupport.gov: Visit this website to learn how to get support 
for mental health, drug, and alcohol issues.
○ FindTreatment.gov: Use this resource to locate treatment 
facilities or providers.

Remember that seeking help is an essential step in the recovery from mental 
or psychological distress. If you're experiencing persistent feelings of sadness, 
anxiety, or other emotional difficulties, don't hesitate to reach out to these 
resources for assistance. You're not alone, and there are people ready to listen 
and support you during difficult times. 🌟

Source(s)
1. Mental health resources: Types and how to access - Medical News Today
2. What is Mental Health? | SAMHSA
3. What is Mental Health? | SAMHSA
4. Tools and Resources - Centers for Disease Control and Prevention
5. Mental Health Resources: What You Need to Know
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textual Article'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textualArticle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
