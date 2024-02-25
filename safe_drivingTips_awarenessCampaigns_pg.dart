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
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green, // Set green background color
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
Safe Driving Tips and Awareness Campaign for Optimal Health and Well-being
Safe driving practices not only protect individuals and their passengers but also contribute 
to the overall health and well-being of communities. This article explores essential safe 
driving tips and highlights the importance of awareness campaigns for promoting road 
safety and improving public health outcomes.

Safe Driving Tips:
Here are detailed safety tips to help prevent accidents and promote safer driving practices 
on the roads:
1. Follow Traffic Laws:
   - Obey posted speed limits, traffic signals, and road signs at all times.
   - Adhere to lane markings and yield right-of-way when required.
   - Respect traffic rules and regulations to ensure the safety of all road users.
2. Avoid Distractions:
   - Stay focused on driving and avoid distractions such as texting, talking on the phone, 
eating, or attending to passengers while behind the wheel.
   - Keep electronic devices out of reach and use hands-free options for phone calls and 
navigation.
3. Maintain a Safe Following Distance:
   - Leave ample space between your vehicle and the one in front to allow for safe braking 
and reaction time.
   - Maintain a minimum of three seconds of following distance under normal driving 
conditions and increase distance in adverse weather or heavy traffic.
4. Wear Seat Belts:
   - Always wear seat belts and ensure that all passengers, including children, are properly 
restrained using appropriate child safety seats or booster seats.
   - Seat belts significantly reduce the risk of injury and fatality in the event of a collision, 
making them a critical safety feature in every vehicle.
5. Drive Sober:
   - Never drive under the influence of alcohol, drugs, or prescription medications that impair 
judgment, coordination, and reaction time.
   - Designate a sober driver, use ride-sharing services, or arrange alternative transportation 
if you plan to consume alcohol or substances that may affect driving ability.
6. Be Mindful of Pedestrians and Cyclists:
   - Exercise caution around pedestrians and cyclists, especially at intersections, crosswalks, 
and designated cycling lanes.
   - Yield to pedestrians in crosswalks and give cyclists sufficient space when passing or 
sharing the road.
7. Use Turn Signals:
   - Signal your intentions to other drivers by using turn signals for lane changes, turns, and 
merges.
   - Check blind spots and use mirrors to ensure that it is safe to manoeuvre before changing 
lanes or making turns.
8. Be Prepared for Emergencies:
   - Carry an emergency kit in your vehicle containing essentials such as a first aid kit, 
flashlight, reflective triangles, and basic tools.
   - Familiarize yourself with emergency procedures and know how to respond in case of 
accidents, breakdowns, or roadside emergencies.
9. Maintain Vehicle Safety:
   - Regularly inspect and maintain your vehicle, including brakes, tires, lights, and fluid 
levels, to ensure optimal performance and safety.
   - Schedule routine maintenance checks and address any issues promptly to prevent 
mechanical failures and breakdowns while driving.
10. Practice Defensive Driving:
    - Anticipate potential hazards and maintain situational awareness while driving.
    - Scan the road ahead, check mirrors frequently, and be prepared to react to unexpected 
situations or sudden changes in traffic conditions.

Awareness Campaign for Good Health and Well-being:
1. Education and Outreach:
   - Launch comprehensive awareness campaigns that educate drivers about 
the importance of safe driving practices, the consequences of reckless 
behaviour, and the impact of road safety on public health.
   - Collaborate with schools, community organizations, and law enforcement 
agencies to deliver targeted messages and resources to drivers of all ages.
2. Promotion of Positive Behaviours:
   - Encourage positive behaviours such as patience, courtesy, and empathy 
among drivers, fostering a culture of mutual respect and cooperation on the 
road.
   - Highlight the benefits of safe driving not only for personal safety but also 
for the well-being of families, communities, and society as a whole.
3.Community Engagement:
   - Engage with local communities to address specific road safety challenges 
and identify opportunities for collective action and intervention.
   - Organize community events, workshops, and safety demonstrations that 
empower individuals to become advocates for safer roads and responsible 
driving practices.
4. Partnerships and Advocacy:
   - Forge partnerships with government agencies, non-profit organizations, 
and private sector stakeholders to amplify the impact of road safety initiatives 
and advocate for policy changes that prioritize public health and well-being.
   - Advocate for infrastructure improvements, enhanced enforcement 
measures, and innovative technologies that promote safer driving 
environments and reduce the incidence of traffic-related injuries and fatalities.

In conclusion, promoting safe driving practices through awareness campaigns 
and education initiatives is essential for fostering healthier, more resilient 
communities. By empowering drivers with the knowledge, skills, and 
resources to make informed decisions behind the wheel, we can create safer 
roads, prevent accidents, and protect the health and well-being of individuals 
and families for generations to come.

Awareness Campaigns all over the world : 
Driving Towards Safety: Exploring World's Road 
Safety Initiatives and Campaigns –
Drive Safe : (Drive Safely Work Week™ Campaign Archive – Network of 
Employers for Traffic Safety)
One of the most popular campaigns on safe driving globally is the "Drive Safe" campaign. 
This campaign is aimed at promoting responsible and safe driving practices among 
motorists, emphasizing the importance of adhering to traffic laws, avoiding distractions, 
and prioritizing road safety. The "Drive Safe" campaign encompasses various initiatives, 
including public awareness campaigns, educational programs, and enforcement efforts, to 
address key issues such as speeding, drunk driving, distracted driving, and seat belt usage.
Key features of the "Drive Safe" campaign include:
1. **Public Awareness Campaigns:** The "Drive Safe" campaign utilizes multimedia 
platforms, including television, radio, social media, and billboards, to disseminate 
messages about safe driving practices to a wide audience. These campaigns often feature 
impactful slogans, visuals, and testimonials to raise awareness and promote behaviour
change.
2. **Educational Programs:** The campaign organizes educational workshops, seminars, 
and training sessions to educate drivers, young motorists, and the general public about the 
importance of safe driving habits. These programs cover topics such as defensive driving 
techniques, hazard awareness, and the consequences of risky behaviours on the road.
3. **Community Engagement:** The "Drive Safe" campaign fosters community engagement 
by collaborating with local organizations, schools, businesses, and government agencies to 
promote road safety initiatives. Community events, roadshows, and outreach activities 
provide opportunities for interactive learning and dialogue on road safety issues.
4. **Enforcement and Regulation:** In addition to awareness and education, the "Drive 
Safe" campaign supports law enforcement efforts to enforce traffic laws and regulations. 
Increased police patrols, sobriety checkpoints, and speed monitoring operations help deter 
unsafe driving behaviours and hold violators accountable for their actions.
5. **Partnerships and Advocacy:** The campaign builds partnerships with stakeholders, 
including road safety organizations, automotive manufacturers, insurance companies, and 
community leaders, to advocate for policies and investments that enhance road safety 
infrastructure, improve vehicle safety standards, and promote responsible driving 
practices.
The "Drive Safe" campaign resonates with audiences worldwide by emphasizing the shared 
responsibility of all road users in creating safer and more sustainable transportation 
environments. Through its comprehensive approach to road safety promotion, the 
campaign strives to reduce the incidence of accidents, injuries, and fatalities on the roads, 
ultimately saving lives and protecting communities.
Here are some more popular safe driving campaigns that have gained recognition globally:
1. "Think!" Campaign (United Kingdom): (THINK! – Road safety)
The "Think!" campaign is led by the UK Department for Transport and aims to raise 
awareness about road safety issues and promote safer driving behaviours. It 
encompasses various initiatives, including television commercials, online resources, and 
educational materials targeting drivers, pedestrians, and cyclists.
2. "Toward Zero Deaths" (TZD) Campaign (United States): (Home - Toward Zero 
Deaths)
The TZD campaign is a national initiative in the United States that aims to eliminate trafficrelated fatalities and serious injuries. It emphasizes a multidisciplinary approach to road 
safety, including education, engineering, enforcement, and emergency medical services.
3. "Vision Zero" (Global): Vision Zero Homepage | Vision Zero
Vision Zero is an international road safety initiative that originated in Sweden and has been 
adopted by cities worldwide. The goal of Vision Zero is to achieve zero fatalities and serious 
injuries on the roads by implementing a holistic approach to road safety, including safer 
road design, traffic calming measures, and public education campaigns.
4. "Road Safety Decade" (Global): Decade of Action for Road Safety 2021-2030 (who.int)
The Road Safety Decade is a United Nations initiative that aims to reduce road traffic 
fatalities and injuries by 50% by 2030. The campaign focuses on improving road 
infrastructure, enhancing vehicle safety standards, and promoting safe driving 
behaviours
through advocacy, partnerships, and policy interventions.
5. "Drive Wise" Campaign (Canada): (National Safe Driving Week Campaign Tackles 
Impaired Driving (drivewise.com))
Led by the Government of Canada, the Drive Wise campaign promotes safe driving practices 
and encourages motorists to avoid risky behaviours such as distracted driving, impaired 
driving, and speeding. It provides educational resources, public service announcements, 
and community outreach initiatives to raise awareness about road safety issues.
6. "Slow Down for Bobby" (New Zealand): The Bobby Bobby Colleran Trust 
(thebobbycollerantrust.org.uk)
This campaign, named after a young boy who was tragically killed in a road accident, urges 
drivers to slow down and obey speed limits in residential areas and school zones. It 
emphasizes the importance of driving cautiously and protecting vulnerable road users, 
including children and pedestrians.
7. "Every Second Counts" (Australia): The leap second is living on borrowed time ahead 
of the vote in Versailles (smh.com.au)
This campaign, launched by the Australian government, raises awareness about the 
consequences of speeding and encourages drivers to prioritize road safety. It highlights the 
fact that every second counts in preventing accidents and saving lives on the roads.
These safe driving campaigns demonstrate a collective effort to address road 
safety challenges and promote responsible driving behaviours on a global 
scale. Through public awareness, education, enforcement, and policy 
interventions, these campaigns strive to create safer road environments and 
reduce the incidence of accidents, injuries, and fatalities worldwide.

CAMPAIGNS IN INDIA : 
In India, several prominent safe driving campaigns have been launched to 
address road safety issues and promote responsible driving behaviours. Here 
are some popular campaigns:
1. "Road Safety Week" by Ministry of Road Transport and Highways 
(MoRTH):
Road Safety Week is an annual event organized by MoRTH to raise 
awareness about road safety issues and promote safe driving practices 
across India. The week-long campaign includes various activities such as 
road safety seminars, workshops, awareness drives, and public outreach 
initiatives.
2. "Sadak Suraksha Jeevan Raksha" Campaign:
Launched by the Ministry of Road Transport and Highways, this 
campaign aims to reduce road accidents and fatalities by promoting 
safe driving habits, including obeying traffic rules, wearing seat belts, 
and avoiding drunk driving. The campaign emphasizes the importance 
of road safety for protecting lives and preventing injuries.
3. "Safe Drive Save Life" Campaign (West Bengal):
Initiated by the West Bengal government, the "Safe Drive Save Life" 
campaign focuses on reducing road accidents and improving road safety 
awareness among motorists. The campaign encourages drivers to 
follow traffic rules, wear helmets and seat belts, and avoid speeding and 
reckless driving behaviours.
4. "Drive Safe, Save Life" Campaign (Kerala):
The Kerala government's "Drive Safe, Save Life" campaign aims to 
reduce road accidents and promote safe driving practices in the state. 
Through public awareness programs, road safety workshops, and 
enforcement efforts, the campaign encourages motorists to prioritize 
road safety and adopt responsible driving behaviours.
5. "Traffic Warden Scheme" (Various States):
Several states in India have implemented the Traffic Warden Scheme to 
enhance road safety and traffic management. Under this scheme, 
volunteers are appointed as traffic wardens to assist law enforcement 
authorities in regulating traffic, educating motorists, and promoting 
safe driving practices on the roads.
6. "Helmet Awareness Campaign" (Various Cities):
Many cities in India have launched helmet awareness campaigns to 
encourage two-wheeler riders to wear helmets for their safety. These 
campaigns use creative messaging, public service announcements, and 
social media platforms to highlight the importance of helmet usage and 
reduce head injuries in motorcycle accidents.
7. "Don't Drink and Drive" Campaigns:
Various organizations and law enforcement agencies conduct 
campaigns to raise awareness about the dangers of drunk driving and 
discourage motorists from driving under the influence of alcohol or 
drugs. These campaigns emphasize the legal consequences, health 
risks, and social impacts of drunk driving.
These safe driving campaigns in India play a vital role in promoting road safety 
awareness, changing attitudes and behaviours, and reducing the number of 
accidents and fatalities on Indian roads. Through concerted efforts by 
government agencies, civil society organizations, and community 
stakeholders, these campaigns strive to create safer and more sustainable 
transportation environments for all road users.
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
