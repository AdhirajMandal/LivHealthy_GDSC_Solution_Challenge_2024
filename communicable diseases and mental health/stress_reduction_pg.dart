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
Guided Imagery: Take a mental vacation by imagining yourself in a 
peaceful place. Picture yourself on a serene beach, listening to the waves, 
smelling the ocean, and feeling the warm sand beneath you. You can use 
guided imagery recordings or practice it on your own by closing your eyes 
and immersing yourself in a calming scene.
1. Meditation: Meditation provides both short-term stress relief and long-lasting benefits. Explore different meditation forms to find what 
resonates with you. Whether it's focused breathing, mindfulness, or 
mantra repetition, meditation helps calm your mind.
2. Progressive Muscle Relaxation: Tense and relax different muscle 
groups systematically. Start from your toes and work your way up. This 
technique promotes physical relaxation and reduces stress.
3. Deep Breathing: Practice deep, slow breaths to activate your body's 
relaxation response. Breathe in deeply through your nose, hold for a few 
seconds, and exhale slowly through your mouth.
4. Go for a Walk: Physical activity, even a short walk, can alleviate stress. It 
gets you moving, boosts endorphins, and clears your mind.
5. Hugs: Physical touch, like hugging a loved one, releases oxytocin (the 
"cuddle hormone") and reduces stress.
6. Aromatherapy: Inhaling soothing scents from essential oils can have a 
calming effect. Try lavender, chamomile, or eucalyptus.
7. Creativity: Engage in creative activities like drawing, painting, or writing. 
Expressing yourself artistically can be therapeutic.
8. Healthy Diet: Nourish your body with balanced meals. Foods rich in 
antioxidants, vitamins, and minerals support overall well-being.
9. Stress Relief Supplements: Consult a healthcare professional for 
supplements like magnesium, ashwagandha, or valerian root.
10. Leisure Activities: Dedicate time to hobbies you enjoy. Whether 
it's gardening, playing an instrument, or cooking, these activities divert 
your focus from stressors.
11. Positive Self-Talk: Challenge negative thoughts and replace 
them with positive affirmations. Be kind to yourself.
12. Yoga: Yoga combines physical movement, breath control, and 
mindfulness. It's excellent for stress management.
13. Gratitude: Reflect on what you're thankful for. Gratitude practices 
improve overall well-being.
14. Exercise: Regular physical activity reduces stress hormones and 
boosts mood.
15. Evaluating Priorities: Assess your commitments and prioritize 
what truly matters.
16. Social Support: Connect with friends, family, or support groups. 
Talking to someone who listens can be therapeutic.
17. Eliminating Stressors: Identify and address sources of stress in 
your life. Sometimes simplifying or letting go of certain responsibilities 
can make a significant difference.
Source(s)
1. What are some tactics for stress management?
2. Stress Relief: 18 Highly Effective Strategies for Relieving Stress
3. Top ways to reduce daily stress - Harvard Health
4. Stress: 10 Ways To Relieve Stress - Cleveland Clinic Health Essentials
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
