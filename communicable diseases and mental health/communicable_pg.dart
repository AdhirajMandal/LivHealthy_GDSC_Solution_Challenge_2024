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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.orange, // Set light background color
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyText1: TextStyle(fontSize: 16, color: Colors.black),
          bodyText2: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black),
        ),
      ),
      home: TextualArticlePage(),
    );
  }
}

class TextualArticlePage extends StatelessWidget {
  final String textualArticle = """
HIV (Human Immunodeficiency Virus)

HIV stands for Human Immunodeficiency Virus. It is a virus that attacks the immune system, specifically targeting CD4 cells (T cells), which are crucial for helping the body fight off infections. HIV weakens the immune system over time, making it difficult for the body to combat various infections and diseases.

HIV is primarily transmitted through certain bodily fluids, including blood, semen, vaginal fluids, and breast milk. The most common modes of transmission include unprotected sexual intercourse (vaginal, anal, or oral sex), sharing needles or syringes contaminated with HIV-infected blood, and from mother to child during pregnancy, childbirth, or breastfeeding.

Once HIV enters the body, it replicates and spreads, progressively damaging the immune system. Some individuals may experience flu-like symptoms shortly after infection, but others may remain asymptomatic for years. Without treatment, HIV infection can progress to AIDS (Acquired Immunodeficiency Syndrome), which is the most advanced stage of HIV infection. At this stage, the immune system is severely compromised, and individuals become susceptible to opportunistic infections and certain cancers.

While HIV cannot be cured, it can be managed with antiretroviral therapy (ART), which consists of a combination of medications that suppress the replication of the virus, allowing individuals with HIV to live longer and healthier lives. Additionally, there are preventive measures such as pre-exposure prophylaxis (PrEP) and post-exposure prophylaxis (PEP) that can help reduce the risk of HIV transmission.

HIV/AIDS remains a significant global health challenge, but with proper education, access to healthcare services, and awareness of preventive measures, the spread of HIV can be reduced, and individuals living with HIV can lead fulfilling lives.

Incidence:
- HIV is primarily transmitted through unprotected sexual intercourse, sharing needles or syringes, from mother to child during childbirth or breastfeeding, and rarely through blood transfusions or organ transplants.
- According to the World Health Organization (WHO), as of 2020, approximately 38 million people worldwide are living with HIV/AIDS, with about 1.5 million new infections reported annually.

Symptoms:
- Early HIV symptoms may include fever, headache, sore throat, swollen lymph nodes, rash, fatigue, and muscle and joint aches.
- Some people may not experience symptoms for years after infection.
- As the virus progresses, it weakens the immune system, making individuals more susceptible to opportunistic infections and certain cancers.

Effects:
- HIV weakens the immune system, leaving individuals vulnerable to opportunistic infections and diseases, such as tuberculosis, pneumonia, candidiasis, and certain cancers like Kaposi's sarcoma.
- If left untreated, HIV can progress to AIDS (Acquired Immunodeficiency Syndrome), characterized by severe immune deficiency and the occurrence of opportunistic infections or cancers.

Mortality Rate:
- With advancements in antiretroviral therapy (ART), HIV infection is now considered a chronic manageable condition rather than an acute fatal illness.
- However, without treatment, HIV infection can lead to AIDS, which significantly increases mortality rates due to the increased risk of opportunistic infections and other complications.

Prevention Tips:
1. Practice Safe Sex:
   - Use condoms consistently and correctly during sexual intercourse, including vaginal, anal, and oral sex.
   - Limit the number of sexual partners and avoid risky sexual behaviors.

2. Use Clean Needles:
   - If injecting drugs, never share needles, syringes, or any injecting equipment.

3. Get Tested and Know Your Partner's Status:
   - Regularly get tested for HIV and other sexually transmitted infections (STIs).
   - Encourage your sexual partners to get tested and know their HIV status.

4. Pre-Exposure Prophylaxis (PrEP):
   - PrEP is a preventive medication for people at high risk of HIV infection.
   - It involves taking a daily pill containing a combination of two antiretroviral drugs.

5. Post-Exposure Prophylaxis (PEP):
   - PEP involves taking antiretroviral drugs within 72 hours of potential HIV exposure to prevent infection.
   - It is typically prescribed for emergency situations, such as unprotected sex or needle-sharing accidents.

Conclusion:
HIV remains a significant global health challenge, but with early diagnosis, access to treatment, and preventive measures, the spread of HIV can be reduced, and individuals living with HIV can lead long and healthy lives. Education, awareness, and access to healthcare services are crucial in combating the HIV/AIDS epidemic.

Websites : 
1. Centers for Disease Control and Prevention (CDC) HIV Basics | HIV/AIDS | CDC
2. World Health Organization HIV and AIDS (who.int)
 
TUBERCULOSIS 
Certainly! Tuberculosis (TB) is a bacterial infection caused by Mycobacterium tuberculosis. It 
primarily affects the lungs but can also affect other parts of the body. Here's detailed information on 
TB incidence, symptoms, effects, mortality rates, and prevention tips:
Incidence: 
- Tuberculosis is a highly infectious disease that spreads through the air when an infected 
person coughs, sneezes, or speaks.
- According to the World Health Organization (WHO), TB is one of the top 10 causes of death 
worldwide and the leading cause of death from a single infectious agent.
- In 2020, an estimated 10 million people worldwide fell ill with TB, with approximately 1.5 
million deaths attributed to the disease.
Symptoms:
- Symptoms of tuberculosis can vary depending on whether it is latent TB infection (LTBI) or 
active TB disease.
- Latent TB infection often has no symptoms and is not contagious.
- Symptoms of active TB disease may include a persistent cough, sometimes with bloody 
sputum, chest pain, weakness or fatigue, weight loss, fever, chills, and night sweats.
Effects: 
- Tuberculosis primarily affects the lungs (pulmonary TB), but it can also affect other organs 
and tissues (extrapulmonary TB) such as the kidneys, spine, and brain.
- If left untreated, TB can cause severe damage to the lungs and other affected organs, 
leading to complications such as respiratory failure, meningitis, and even death.
Mortality Rate: 
- The mortality rate from tuberculosis varies depending on factors such as the effectiveness 
of healthcare systems, access to treatment, and the prevalence of drug-resistant strains.
- Mortality rates are higher among individuals with compromised immune systems, such as 
those living with HIV/AIDS or malnutrition.
- With timely diagnosis and appropriate treatment, the mortality rate from TB can be 
significantly reduced.
Prevention Tips: 
1. Vaccination:
 - The Bacille Calmette-Guérin (BCG) vaccine is used to prevent tuberculosis, especially in children.
 - It is most effective in preventing severe forms of TB in children but offers variable protection 
against pulmonary TB in adults.
2. Infection Control Measures:
 - Promote good respiratory hygiene by covering the mouth and nose with a tissue or elbow when 
coughing or sneezing.
 - Ensure proper ventilation in indoor spaces to reduce the concentration of infectious droplets.
3. Screening and Testing:
 - Screen high-risk populations, such as individuals living with HIV/AIDS, those in close contact with 
TB patients, and healthcare workers.
 - Conduct regular testing for TB infection, especially in endemic areas.
4. Treatment of Latent TB Infection:
 - Individuals with latent TB infection may be treated with medications to prevent the progression to 
active TB disease.
 - Treatment regimens may include isoniazid or rifampin for several months.
5. Treatment of Active TB Disease:
 - Active TB disease is treated with a combination of antibiotics for a minimum of six months.
 - Directly observed therapy (DOT) is often recommended to ensure adherence to treatment and 
reduce the risk of drug resistance.
6. Contact Tracing:
 - Identify and test individuals who have been in close contact with TB patients to prevent further 
transmission of the disease.
Conclusion:
Tuberculosis remains a significant global health challenge, but with early detection, proper 
treatment, and implementation of preventive measures, the burden of TB can be reduced. Public 
health efforts, including vaccination, infection control, and access to healthcare services, play a 
crucial role in combating the spread of tuberculosis and improving outcomes for affected individuals.
MALARIA 
Malaria is a life-threatening disease caused by parasites transmitted to humans through the 
bites of infected female Anopheles mosquitoes. Here's detailed information on malaria, 
including its incidence, symptoms, effects, mortality rates, and prevention tips:
 
Incidence: 
- Malaria is prevalent in tropical and subtropical regions, particularly in sub-Saharan Africa, 
South Asia, and parts of Central and South America.
- According to the World Health Organization (WHO), there were an estimated 241 million 
cases of malaria worldwide in 2020, resulting in approximately 627,000 deaths.
- Children under the age of 5 and pregnant women are particularly vulnerable to severe 
complications from malaria.
Symptoms:
- Symptoms of malaria typically appear 10-15 days after the mosquito bite, though they can 
sometimes take longer to manifest.
- Common symptoms include fever, chills, sweats, headache, body aches, nausea, vomiting, 
and fatigue.
- In severe cases, malaria can lead to complications such as cerebral malaria (affecting the 
brain), severe anemia, respiratory distress, organ failure, and death.
Effects:
- Malaria is caused by parasites of the Plasmodium genus, with Plasmodium falciparum 
being the most deadly species.
- The parasites multiply within red blood cells, leading to their destruction and the release of 
toxins into the bloodstream.
- Severe malaria can cause multi-organ dysfunction and is a medical emergency requiring 
immediate treatment.
Mortality Rate: 
- The mortality rate from malaria varies depending on factors such as access to healthcare, 
the effectiveness of prevention measures, and the prevalence of drug-resistant strains.
- Prompt diagnosis and appropriate treatment are crucial in reducing mortality rates 
associated with malaria.
- Vulnerable populations, such as young children and pregnant women, are at higher risk of 
severe complications and death from malaria.
Prevention Tips: 
1. Mosquito Control:
− Use insecticide-treated bed nets (ITNs) to protect against mosquito bites while 
sleeping.
− Apply insect repellent containing DEET to exposed skin when outdoors, especially 
during peak mosquito activity times.
− Use screens on windows and doors to prevent mosquitoes from entering living 
spaces.
2. Chemoprophylaxis:
- Travelers visiting malaria-endemic areas may be prescribed preventive medication 
(chemoprophylaxis) to reduce the risk of infection.
- The choice of medication depends on factors such as destination, duration of stay, 
and individual health status.
3. Environmental Management:
- Drain stagnant water sources around living areas to eliminate mosquito breeding 
grounds.
- Use larvicides or biological control agents to target mosquito larvae in water bodies.
4. Early Diagnosis and Treatment:
− Seek prompt medical attention if experiencing symptoms of malaria, especially if in 
or returning from a malaria-endemic area.
− Early diagnosis and appropriate treatment can prevent complications and reduce the 
risk of severe illness and death.
5. Community Education:
− Raise awareness about malaria prevention strategies, symptoms, and the importance 
of seeking timely medical care within affected communities.
Conclusion:
Malaria remains a significant public health challenge in many parts of the world, particularly 
in low-income countries with limited access to healthcare resources. Efforts to control and 
eliminate malaria require a comprehensive approach involving vector control, early 
diagnosis, prompt treatment, and community engagement. By implementing effective 
prevention measures and improving access to healthcare services, the global burden of 
malaria can be reduced, saving lives and improving the health and well-being of affected 
populations.
HEPATITIS B 
Hepatitis B is a viral infection that affects the liver and can lead to both acute and chronic 
disease. Here's detailed information on Hepatitis B, including its incidence, symptoms, 
effects, mortality rates, and prevention tips:
Incidence:
− Hepatitis B virus (HBV) infection is a global health problem, with the highest 
prevalence in sub-Saharan Africa and parts of Asia.
− According to the World Health Organization (WHO), an estimated 257 million people 
were living with chronic HBV infection worldwide in 2019.
− HBV is primarily transmitted through exposure to infectious blood or body fluids, 
such as during childbirth, unprotected sexual contact, sharing needles or syringes, 
and through contaminated blood transfusions or medical procedures.
Symptoms:
− Many people with Hepatitis B infection do not experience symptoms, especially 
during the acute phase.
− Symptoms of acute Hepatitis B may include fever, fatigue, loss of appetite, nausea, 
vomiting, abdominal pain, dark urine, joint pain, and jaundice (yellowing of the skin 
and eyes).
− Chronic Hepatitis B infection can lead to long-term liver damage, cirrhosis, liver 
failure, and an increased risk of liver cancer.
Effects:
− Hepatitis B virus infects liver cells, leading to inflammation and damage to the liver 
tissue.
− Chronic Hepatitis B infection can progress silently for years, gradually causing liver 
damage and increasing the risk of complications such as cirrhosis and liver cancer.
− Hepatitis B is a major cause of liver-related morbidity and mortality worldwide.
Mortality Rate: 
− The mortality rate from Hepatitis B varies depending on factors such as the age of 
the individual, the presence of other medical conditions, and access to healthcare 
services.
− Chronic Hepatitis B infection increases the risk of liver-related complications, 
including liver failure and liver cancer, which can be life-threatening.
− With early diagnosis, appropriate medical management, and access to antiviral 
therapy, the risk of complications and mortality from Hepatitis B can be significantly 
reduced.
Prevention Tips: 
1. Vaccination:
− Hepatitis B vaccine is highly effective in preventing HBV infection.
− The vaccine is typically administered as a series of three or four doses, starting in 
infancy or early childhood.
− Vaccination is also recommended for individuals at higher risk of HBV infection, 
including healthcare workers, people with multiple sexual partners, and those who 
inject drugs.
2. Safe Injection Practices:
− Avoid sharing needles, syringes, or other injection equipment to prevent the 
transmission of HBV and other bloodborne pathogens.
− Use sterile needles and syringes for medical procedures and injections.
3. Safe Sexual Practices:
− Practice safe sex by using condoms consistently and correctly, especially with new or 
multiple sexual partners.
− Limit the number of sexual partners to reduce the risk of HBV transmission.
4. Screening and Testing:
− Pregnant women should be screened for Hepatitis B infection during prenatal care to 
prevent mother-to-child transmission.
− Individuals at higher risk of HBV infection should undergo routine screening and 
testing to detect infection early and initiate appropriate medical management.
5. Post-Exposure Prophylaxis (PEP):
− Individuals exposed to HBV through occupational or non-occupational exposure 
should receive post-exposure prophylaxis (PEP) to prevent infection.
− PEP may involve administration of Hepatitis B vaccine and/or hepatitis B immune 
globulin (HBIG) depending on the circumstances of exposure.
Conclusion: 
Hepatitis B is a significant public health concern globally, with millions of people affected by 
chronic infection and its associated complications. Prevention efforts, including vaccination, 
safe injection practices, safe sexual behaviors, and timely screening and testing, are essential 
in reducing the burden of Hepatitis B and preventing transmission of the virus. Early 
diagnosis and appropriate medical management are key to reducing the risk of liver-related 
complications and improving outcomes for individuals living with Hepatitis B infection.
NEGLECTED TROPICAL DISEASES 
Neglected Tropical Diseases (NTDs) are a group of infectious diseases that primarily affect 
populations living in tropical and subtropical regions, particularly in low-income countries 
with limited access to healthcare resources. These diseases are called "neglected" because 
they historically receive less attention, funding, and research compared to other diseases 
that have a higher profile in public health.
NTDs are often associated with poverty, inadequate sanitation, poor housing conditions, and 
lack of access to clean water. They affect over a billion people worldwide and can cause 
significant disability, disfigurement, and socioeconomic burden in affected communities.
Prevention and control of neglected tropical diseases involve strategies such as mass drug 
administration, vector control, improved access to clean water and sanitation, health 
education, and research and development of new treatments and diagnostics. Global efforts 
to address neglected tropical diseases aim to alleviate the burden of these diseases and 
improve the health and well-being of affected populations.
Here's some detailed information on neglected tropical diseases, including their incidence, 
effects, and prevention:
Incidence:
− Neglected tropical diseases include a diverse group of infections caused by bacteria, 
viruses, parasites, and other pathogens.
− They are often associated with poverty, inadequate sanitation, poor housing 
conditions, and limited access to clean water and healthcare services.
− Some common neglected tropical diseases include:
• Lymphatic filariasis (LF): Also known as elephantiasis, LF is caused by parasitic 
worms transmitted by mosquitoes. It can lead to severe swelling of the limbs 
and genitalia.
• Onchocerciasis (River Blindness): Onchocerciasis is caused by a parasitic 
worm transmitted by black flies. It can lead to skin rashes, itching, eye lesions, 
and blindness.
• Schistosomiasis (Bilharzia): Schistosomiasis is caused by parasitic worms 
transmitted through contact with contaminated water. It can lead to 
abdominal pain, diarrhoea, blood in the urine, and liver damage.
• Soil-Transmitted Helminthiasis: These are infections caused by parasitic 
worms that live in the soil. They include roundworm, whipworm, and 
hookworm infections, which can cause malnutrition, anaemia, and stunted 
growth.
• Trachoma: Trachoma is a bacterial infection of the eyes that can lead to 
scarring of the eyelids and blindness if left untreated.
• Dengue Fever: Dengue is a viral infection transmitted by mosquitoes. It can 
cause high fever, severe headache, joint and muscle pain, and in severe cases, 
dengue haemorrhagic fever or dengue shock syndrome.
• Chagas Disease: Chagas disease is caused by a parasite transmitted by 
triatomine bugs. It can lead to heart disease, digestive problems, and 
neurological disorders.
• Leishmaniasis: Leishmaniasis is caused by parasites transmitted by sandflies. 
It can lead to skin sores, ulcers, and in severe cases, damage to internal 
organs.
• Sleeping sickness (African trypanosomiasis): Sleeping sickness is caused by 
parasites transmitted by tsetse flies. It can lead to neurological symptoms, 
including sleep disturbances, confusion, and coma.
• Buruli ulcer: Buruli ulcer is a bacterial infection that affects the skin and soft 
tissues. It can lead to large, painless ulcers and severe disability if left 
untreated.
Effects:
− Neglected tropical diseases can cause chronic disability, disfigurement, and long-term 
health problems.
− They contribute to malnutrition, stunted growth, anaemia, and impaired cognitive 
development, particularly in children.
− NTDs can have significant social and economic impacts, including reduced 
productivity, loss of income, and increased healthcare expenditures for affected 
individuals and communities.
Prevention and Control: 
 Prevention and control strategies for neglected tropical diseases include:
− Mass drug administration (MDA) programs to distribute preventive chemotherapy for 
diseases such as LF, onchocerciasis, schistosomiasis, and soil-transmitted 
helminthiasis.
− Improved access to clean water and sanitation to reduce the risk of waterborne 
diseases such as schistosomiasis and cholera.
− Vector control measures to reduce the transmission of diseases spread by 
mosquitoes, flies, and other vectors.
− Health education and community engagement to promote awareness of NTDs, 
preventive measures, and treatment options.
− Research and development of new tools, diagnostics, and treatments for neglected 
tropical diseases.
Global Efforts: 
− The World Health Organization (WHO) and other international organizations have 
prioritized efforts to control and eliminate neglected tropical diseases through 
collaborative partnerships, funding initiatives, and advocacy campaigns.
− The London Declaration on Neglected Tropical Diseases, launched in 2012, aims to 
accelerate progress towards the control and elimination of NTDs by 2020.
Conclusion: 
Neglected tropical diseases represent a significant public health challenge, particularly in 
resource-limited settings where they disproportionately affect the most vulnerable 
populations. Addressing NTDs requires sustained political commitment, increased 
investment in healthcare infrastructure, and innovative approaches to disease prevention, 
control, and treatment. By prioritizing neglected tropical diseases on the global health 
agenda, it is possible to improve the health and well-being of millions of people worldwide
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
