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
Information on Sustainable 
transportation 
Sustainable transportation refers to modes of transportation and 
infrastructure that minimize environmental impact, promote social 
equity, and enhance economic viability. It aims to reduce reliance on 
fossil fuels, mitigate greenhouse gas emissions, improve air quality, 
enhance public health, and create more liveable communities. Here's a 
breakdown of key aspects and initiatives within sustainable 
transportation:
1. Reimagining Urban Mobility: Embracing Compact 
Electric Vehicles for a Greener Tomorrow in 
Sustainable Cities –
 
Electric vehicles (EVs) represent a transformative technology poised to 
revolutionize transportation systems worldwide. Electric vehicles powered by 
renewable energy sources offer a cleaner and more sustainable alternative to 
traditional internal combustion engine vehicles. Incentives such as tax credits, 
rebates, and subsidies can encourage the adoption of electric vehicles and expand 
charging infrastructure.
Here are broad details about electric vehicles and their potential sustainability 
benefits for society:
1. Cleaner Energy Source:
 - EVs are powered by electricity, which can be generated from renewable energy 
sources such as solar, wind, and hydroelectric power. Unlike conventional vehicles 
that rely on fossil fuels, EVs produce zero tailpipe emissions, thereby reducing air 
pollution and improving air quality in urban areas.
2. Reduced Greenhouse Gas Emissions:
 - By shifting from internal combustion engine vehicles to electric ones, society can 
significantly reduce greenhouse gas emissions associated with transportation. EVs 
produce fewer emissions over their lifecycle compared to traditional vehicles, 
especially when powered by renewable energy sources.
3. Energy Efficiency:
Electric motors are more energy-efficient than internal combustion engines, 
converting a higher percentage of energy from the battery into propulsion. This 
efficiency translates into lower energy consumption per mile travelled, reducing 
overall energy demand and dependence on finite fossil fuel resources.
4. Lower Operating Costs:
 - EVs typically have lower operating costs compared to conventional vehicles. 
Electricity is generally cheaper than gasoline or diesel fuel on a per-mile basis, 
resulting in lower fuelling costs for EV owners. Additionally, EVs have fewer moving 
parts and require less maintenance, leading to potential long-term cost savings for 
consumers.
5. Noise Reduction:
 - Electric motors operate more quietly than internal combustion engines, 
contributing to reduced noise pollution in urban environments. This can lead to 
quieter and more pleasant streets, improving quality of life for residents and 
enhancing urban liveability.
6. Diversification of Energy Sources:
 - The adoption of electric vehicles enables societies to diversify their energy 
sources for transportation, reducing reliance on imported oil and enhancing energy 
security. By leveraging domestic renewable energy resources, countries can bolster 
energy independence and resilience against global energy market fluctuations.
7. Technological Innovation and Job Creation:
 - The transition to electric vehicles drives innovation in battery technology, 
charging infrastructure, and vehicle design. This creates opportunities for research 
and development, as well as job creation in manufacturing, engineering, and related 
sectors. Furthermore, the EV industry fosters entrepreneurship and investment in 
emerging technologies and clean energy solutions.
8. Health Benefits:
 - The reduction of air pollution from tailpipe emissions can lead to significant 
health benefits for society. Cleaner air quality can lower rates of respiratory 
illnesses, cardiovascular diseases, and other health conditions associated with air 
pollution exposure, resulting in improved public health outcomes and reduced 
healthcare costs.
By embracing electric vehicles as a sustainable transportation solution, society can 
mitigate environmental impact, enhance energy efficiency, promote economic 
growth, and improve public health and well-being for current and future 
generations. Through collaborative efforts among governments, businesses, and 
communities, the widespread adoption of electric vehicles can help realize a 
cleaner, greener, and more sustainable future.
DATA FROM INTERNATIONAL TRANSPORT FORUM (Shifting 
the Focus: Smaller Electric Vehicles for Sustainable Cities | ITF (itf-oecd.org))
Revolutionizing the Landscape: While many envision the widespread adoption of electric 
vehicles (EVs) as a direct swap for traditional fossil-fuel-powered counterparts, the real 
transformation lies in the surge of smaller, more nimble EVs tailored for urban living. These 
compact, lighter, and shorter-ranged vehicles are not just a replacement but a reimagining 
of urban mobility. Beyond the environmental benefits, such as reduced emissions and safer 
streets, this shift offers a chance for cities to embrace a more sustainable and efficient 
electric transportation system. This comprehensive report delves into diverse use cases 
driving this change, assesses the sustainability impacts across various EV scenarios, and 
provides strategic recommendations for authorities aiming to harness this transition for 
the creation of greener, smarter cities.
Summary
• Shifting focus to smaller electric vehicles in cities for sustainability.
• Broader uptake of smaller EVs shows more sustainability benefits than like-for-like 
approach.
• Emerging forms of ridesourcing and microtransit can complement public transport.
• Faster EV uptake by 2030 will impact cities with increased electricity demand.
• Need for solid public charging networks for private and shared EVs in urban areas.
2 -The Allure and Impact of PUBLIC TRANSIT for 
Sustainable Cities :
Public transit systems play a crucial role in providing efficient, 
affordable, and environmentally friendly transportation options for 
urban and suburban populations. Here's a detailed description of the 
importance and benefits of public transit:
1. Efficient Mobility Solutions:
Public transit encompasses a variety of modes, including buses, 
trains, trams, subways, and ferries, which efficiently move large 
numbers of people within and between urban areas. These systems 
offer convenient alternatives to private vehicles, especially in 
densely populated cities where traffic congestion is a significant 
concern.
2. Accessibility and Inclusivity:
Public transit networks are designed to serve diverse communities, 
providing accessible transportation options for individuals of all 
ages, incomes, and abilities. Unlike private vehicles, which may be 
inaccessible or unaffordable for some populations, public transit 
ensures that everyone has the opportunity to travel safely and 
independently.
3. Environmental Benefits:
Public transit is inherently more sustainable and environmentally 
friendly than individual car usage. By consolidating passenger trips, 
public transit helps reduce traffic congestion and lower greenhouse 
gas emissions, thus mitigating air pollution and contributing to 
improved air quality in urban areas. Additionally, investments in 
electric and hybrid transit vehicles further reduce the carbon 
footprint of public transportation systems.
4. Traffic Congestion Reduction:
Expanding and improving public transit networks can alleviate traffic 
congestion by providing viable alternatives to driving alone. As more 
people opt for public transit, there are fewer cars on the road, 
resulting in smoother traffic flow, shorter commute times, and 
reduced stress for commuters.
5. Land Use and Urban Development:
Well-designed public transit systems influence urban development 
patterns by promoting compact, transit-oriented communities. 
Transit-oriented development (TOD) encourages mixed-use 
developments, higher-density housing, and pedestrian-friendly 
neighbourhoods located near transit hubs, reducing the need for 
long commutes and fostering vibrant, sustainable urban 
environments.
6. Social Equity:
Public transit plays a crucial role in promoting social equity by 
providing affordable transportation options for low-income 
households and underserved communities. Access to public transit 
enhances mobility and connectivity, enabling individuals to access
employment, education, healthcare, and recreational opportunities 
regardless of their socioeconomic status or geographic location.
7. Safety and Reliability:
Public transit systems prioritize safety and reliability, implementing 
rigorous maintenance protocols, security measures, and emergency 
response procedures to ensure passenger well-being. Compared to 
private vehicles, public transit offers a safer mode of transportation, 
with trained operators and dedicated infrastructure designed to 
minimize risks and accidents.
In conclusion, public transit systems offer numerous benefits, 
including efficient mobility solutions, environmental sustainability, 
economic development, social equity, and enhanced quality of life 
for urban residents. By prioritizing investments in public transit 
infrastructure and promoting multimodal transportation options, 
cities can create more livable, resilient, and inclusive communities 
for present and future generations.
Sustainable Transportation Infrastructure:
 - Green Infrastructure: Incorporating green spaces, trees, and 
permeable surfaces into urban planning can improve air quality, reduce 
heat island effects, and enhance the overall aesthetics of 
transportation infrastructure.
 - Smart Transportation Systems: Implementing intelligent 
transportation systems, such as traffic management technologies, realtime data collection, and smart traffic lights, can optimize traffic flow 
and reduce fuel consumption.
 - Electric Vehicle Charging Stations: Developing a network of 
charging infrastructure for electric vehicles promotes the adoption of 
clean transportation alternatives.
 - Alternative Fuels: Encouraging the use of alternative fuels, such as 
biofuels, hydrogen, and compressed natural gas, can help reduce 
dependence on fossil fuels and lower carbon emissions.
Sustainable Transportation Policies and Initiatives:
 -Emission Standards: Implementing and enforcing strict emission 
standards for vehicles helps reduce air pollution and encourages the 
development and adoption of cleaner technologies.
 - Transportation Demand Management (TDM): TDM strategies aim to 
optimize the use of existing transportation infrastructure by promoting 
alternatives such as telecommuting, flexible work hours, and efficient 
route planning.
 - Urban Planning: Well-designed urban planning with mixed land use, 
pedestrian-friendly neighbourhoods, and accessible public 
transportation can create sustainable and inclusive cities.
 - Incentives for Sustainable Transportation: Governments and 
organizations often provide incentives, such as tax credits, subsidies, 
and preferential parking, to encourage the adoption of sustainable 
transportation options.
Benefits of Sustainable Transportation:
 - Environmental Benefits: Reduced air pollution, lower greenhouse 
gas emissions, and conservation of natural resources contribute to 
environmental sustainability.
 - Health Benefits: Active modes of transportation, such as walking 
and cycling, promote physical health, reduce sedentary lifestyles, and 
decrease the risk of chronic diseases.
 - Economic Benefits: Sustainable transportation can lead to cost 
savings in healthcare, reduced infrastructure maintenance costs, and 
job creation in the renewable energy and clean transportation sectors.
 - Social Equity: Accessible and affordable transportation options 
contribute to social equity by ensuring that all members of society, 
regardless of income or location, have access to reliable and efficient 
transportation.
Embracing Sustainable Mobility: Promoting Public 
Transportation and Cycling for Greener, Healthier 
Cities
In the face of urbanization and environmental challenges, promoting 
sustainable modes of transportation like public transit and cycling has 
become imperative for creating greener, healthier cities. This article 
explores the benefits of public transportation and cycling, backed by 
statistical data, and discusses solutions that not only reduce 
environmental impact but also promote health and well-being.
Benefits of Public Transportation:
1. Environmental Impact: Public transit reduces greenhouse gas 
emissions and air pollution by consolidating passenger trips, thus 
mitigating the negative effects of urban congestion.
2. Traffic Congestion: A well-developed public transportation system 
helps alleviate traffic congestion, reducing travel times and enhancing 
the overall efficiency of urban mobility.
3. Accessibility: Public transit provides accessible transportation 
options for individuals of all ages, incomes, and abilities, fostering 
social inclusion and equity within communities.
Statistical Data:
- According to the American Public Transportation Association, every 1 USD 
invested in public transportation generates approximately 4 USD in 
economic returns.
- Cities with robust public transit systems report lower rates of traffic 
accidents and fatalities compared to those heavily reliant on private 
vehicles.
- In a study conducted by the European Cyclists' Federation, regions 
with high levels of cycling experience improved public health outcomes 
and reduced healthcare costs.
Benefits of Cycling:
1. Physical Health:
Cycling offers numerous benefits for health and well-being, making 
it an excellent form of exercise and mode of transportation. Here are 
some of the key benefits:
1. Cardiovascular Health:
 - Cycling is an excellent cardiovascular exercise that gets your heart 
pumping and increases blood circulation throughout the body.
 - Regular cycling helps strengthen the heart muscles, lower resting 
heart rate, and improve overall cardiovascular fitness.
 - It reduces the risk of developing heart disease, stroke, and 
hypertension by improving cholesterol levels and lowering blood 
pressure.
2. Muscular Strength and Endurance:
 - Cycling engages various muscle groups, including the legs, core, and 
upper body, helping to build strength and endurance.
 - Pedalling against resistance, whether on flat terrain or uphill, helps 
tone leg muscles, including quadriceps, hamstrings, and calves.
 - Cycling also engages the core muscles, stabilizing the body and 
improving posture and balance.
3. Weight Management and Fat Loss:
 - Cycling is an effective calorie-burning activity that can help 
individuals manage weight and reduce body fat.
 - Regular cycling, especially at moderate to high intensities, boosts 
metabolism and helps burn calories both during the activity and 
throughout the day.
 - It promotes lean muscle mass development, which contributes to 
increased metabolic rate and improved body composition.
4. Mental Health and Well-being:
 - Cycling is a mood-boosting activity that releases endorphins, the 
body's natural feel-good hormones, promoting a sense of well-being 
and reducing stress, anxiety, and depression.
 - Spending time outdoors while cycling exposes individuals to natural 
sunlight and fresh air, which can enhance mood, alleviate symptoms of 
seasonal affective disorder (SAD), and improve overall mental health.
 - Cycling provides opportunities for mindfulness and relaxation, 
allowing riders to disconnect from daily stressors and enjoy the present 
moment while engaging in physical activity.
5. Joint Health and Low-Impact Exercise:
 - Cycling is a low-impact exercise that places minimal stress on the 
joints, making it suitable for individuals of all ages and fitness levels.
 - Unlike high-impact activities like running or weightlifting, cycling is 
gentle on the knees, hips, and ankles, reducing the risk of injury and 
joint wear and tear.
 - It is an ideal exercise for individuals with joint pain, arthritis, or 
orthopaedic conditions seeking to improve mobility, flexibility, and joint 
function.
6. Longevity and Quality of Life:
 - Engaging in regular physical activity like cycling is associated with 
increased longevity and a reduced risk of premature death from chronic 
diseases.
 - Cycling promotes overall health and vitality, enhancing quality of life 
by improving physical fitness, mental well-being, and functional 
independence.
 - Incorporating cycling into daily routines fosters a sustainable, active 
lifestyle that supports healthy aging and long-term well-being.
In summary, cycling offers a multitude of health and well-being 
benefits, ranging from improved cardiovascular fitness and muscular 
strength to enhanced mental health and longevity. By incorporating 
cycling into daily routines, individuals can enjoy the physical, mental, 
and emotional rewards of this enjoyable and sustainable form of 
exercise.3. Environmental Sustainability: Cycling is a zero-emission 
mode of transportation, contributing to cleaner air, reduced carbon 
emissions, and a more sustainable urban environment.
Promoting Health and Well-being:
1. Infrastructure Investment: Cities can invest in cycling infrastructure, 
including bike lanes, bike-sharing programs, and secure parking 
facilities, to encourage more people to choose cycling as a viable 
transportation option.
2. Public Awareness Campaigns: Educational initiatives and public 
outreach efforts can raise awareness about the health benefits of 
cycling and the importance of active transportation for personal and 
environmental well-being.
3. Policy Support: Governments can implement policies and incentives 
to promote cycling, such as subsidies for bicycle purchases, tax 
incentives for cycling commuters, and integration of cycling into urban 
planning strategies.
4. Collaborative Partnerships: Collaboration between government 
agencies, private sector stakeholders, and community organizations 
can drive collective action towards creating bike-friendly cities and 
promoting a culture of active living.
Conclusion:
Promoting public transportation and cycling is not just about reducing 
traffic congestion or lowering carbon emissions; it's about creating 
healthier, more liveable cities for everyone. By investing in sustainable 
transportation infrastructure, raising public awareness, and prioritizing 
health and well-being, cities can pave the way towards a more 
sustainable future where people and the planet thrive together. Let's 
pedal towards a greener, healthier tomorrow, one bike ride at a time.
Promoting Safer Cycling: Strategies for Enhancing 
Road Safety and Protecting Vulnerable Road Users : 
In road safety, cycling presents numerous benefits and considerations to ensure the 
well-being of cyclists and other road users. Here's how cycling contributes to road 
safety and considerations for promoting safer cycling:
1. Enhanced Visibility:
 - Cyclists are more visible on the road compared to pedestrians, especially when 
equipped with reflective gear, bright clothing, and lights at night.
 - Promoting visibility through proper lighting and reflective equipment reduces 
the risk of collisions, especially in low-light conditions or adverse weather.
2. Reduced Traffic Congestion:
 - Cycling helps alleviate traffic congestion by reducing the number of vehicles on 
the road, thus lowering the risk of accidents and collisions.
 - Promoting cycling infrastructure, such as bike lanes and designated cycling 
paths, encourages more people to choose cycling as a viable transportation option, 
further reducing congestion and enhancing road safety.
3. Improved Awareness and Education:
 - Educating both cyclists and motorists about road safety rules and regulations 
fosters mutual respect and understanding between different road users.
 - Public awareness campaigns and educational initiatives can highlight the 
importance of sharing the road responsibly and adhering to traffic laws to prevent 
accidents and injuries.
4. Infrastructure and Design:
 - Investing in cycling-friendly infrastructure, such as bike lanes, separated cycling 
paths, and bike racks, creates safer environments for cyclists and encourages more 
people to cycle.
 - Designing intersections and roadways with cyclists in mind, including dedicated 
bicycle traffic signals and protected intersections, reduces the risk of collisions and 
enhances overall road safety.
5. Vulnerable Road User Protection:
 - Recognizing cyclists and pedestrians as vulnerable road users underscores the 
importance of prioritizing their safety through targeted interventions and policies.
 - Implementing measures such as lower speed limits in urban areas, traffic 
calming measures, and improved signage and road markings helps protect 
vulnerable road users, including cyclists, from collisions and injuries.
6. Enforcement and Regulation:
 - Enforcing traffic laws and regulations, including speed limits, yielding to cyclists 
at intersections, and maintaining safe passing distances, promotes safer 
interactions between cyclists and motorists.
 - Implementing strict penalties for traffic violations and reckless driving behaviors 
reinforces a culture of accountability and responsibility among all road users.
7. Technology and Innovation:
 - Advancements in technology, such as vehicle detection systems, blind spot 
monitoring, and collision avoidance technology, can help mitigate the risk of 
accidents involving cyclists and other vulnerable road users.
 - Integrating cycling-specific safety features into urban planning and 
transportation infrastructure fosters safer environments for cyclists and enhances 
overall road safety.
In conclusion, promoting road safety for cyclists requires a multifaceted approach 
that addresses infrastructure, education, enforcement, and technological 
advancements. By prioritizing the safety of cyclists and implementing targeted 
interventions, communities can create safer roadways, reduce accidents and 
injuries, and encourage more people to embrace cycling as a sustainable and safe 
mode of transportation.
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
