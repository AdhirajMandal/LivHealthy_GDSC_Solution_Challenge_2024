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
        primarySwatch: Colors.blue
        ,scaffoldBackgroundColor: Colors.blue, // Set green background color
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
REDUCING 
PERSONAL 
ENVIRONMENTAL 
IMPACT
 



1. Avoid single-use items: Refrain from using disposable plastic items. 
Opt for reusable alternatives instead.
2. Choose organic/ethical clothing: Opt for clothing made with fewer 
chemicals and eco-friendly materials.
3. Skip gum: If you can, avoid buying or chewing gum. If needed, consider 
natural alternatives like Glee Gum.
4. Ditch gift wrap: Use creative alternatives like kids' artwork, magazines, 
or reusable bags for wrapping gifts.
5. Say no to water in plastic bottles: Carry a reusable water bottle 
instead.
6. Opt for minimal packaging: Choose products with less packaging, 
especially plastic.
7. Bring your own containers: Avoid takeout containers by bringing your 
own bag or container.
8. Reuse egg, fruit, and veggie containers: Return them to farmers at 
local markets for reuse.
9. Shop local and organic: Support farmers' markets and reduce food 
miles.
10. Reduce meat consumption: Consider plant-based meals more 
often.
11. Use energy-efficient appliances: Save electricity and reduce 
your carbon footprint.
12. Turn off lights and devices: Be mindful of energy usage.
13. Unplug chargers: Even when not in use, chargers consume 
energy.
14. Carpool or use public transport: Reduce emissions by sharing 
rides or using eco-friendly transportation.
Plant trees: Trees absorb carbon dioxide and improve air quality.
15. Recycle properly: Follow recycling guidelines to minimize waste.
16. Compost: Turn food scraps into nutrient-rich soil.
17. Choose reusable bags: Say no to plastic bags and opt for 
reusable ones.
18. Reduce paper usage: Go digital whenever possible.
19. Conserve water: Fix leaks and use water-saving devices.
20. Support sustainable brands: Choose products from companies 
committed to eco-friendly practices.
21. Reduce food waste: Plan meals and use leftovers effectively.
22. Buy secondhand: Extend the life of products by purchasing used 
items.
23. Use natural cleaning products: Avoid harsh chemicals.
24. Reduce air travel: Opt for alternatives like trains or buses.
25. Minimize fast fashion: Invest in quality clothing that lasts longer.
26. Practice mindful consumption: Buy only what you truly need.
27. Educate others: Spread awareness about environmental issues.
28. Participate in clean-up events: Help keep your community 
clean.
Source(s)
1. 30 Simple Ways to Reduce Your Impact on the Environment
2. Your Personal Action Guide for the Environment - Medium
3. Reduce your impact | WWF
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Driving Tips and Awareness Campaign'),
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
