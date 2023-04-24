import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:clinic/pages/appointment_page.dart';

import '../util/doctor_card.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Our Services',style: GoogleFonts.andika(fontSize: 25,fontWeight: FontWeight.w400),),
        actions: [],
      ),

      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(

                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),

                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Laboratory Services'),
                            leading: Lottie.asset('lib/icons/42187-laboratory-icon.json',height: 70,),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                child: Column(
                                  children: [

                                    ElevatedButton(
                                      onPressed: () {
                                        print('Pressed ElevatedButton');

                                      },
                                      child: Text('Book Appointment Now'),
                                    ),

                                    Text('We have professional laboratory diagnostic services for patients in our care, as well as collection services for outpatient clinics. We provide clinical laboratory tests for hospital patients, private outpatients, and ambulatory care center patients.Our goal is to improve the health of our community by providing timely, accurate and cost-effective testing services. We provide a full range of testing services.Lab tests are a vital part of your medical care because they give you and your doctors detailed, objective data about your health. Whether you need regular bloodwork or urine testing as part of a checkup or specialized tests to diagnose rare conditions, count on us to provide an extensive range of services with some of the quickest turnaround times.Our staff of are highly trained and dedicated to providing reliable test results to give you and your doctor a better understanding of your health. If your doctor detects risks or suspects certain conditions, he or she may recommend specific lab tests. You can also ask your doctor about taking tests if you want a clearer picture of your health or you’re worried about specific symptoms. Your doctor should have a good understanding of your personal medical history, so he or she will be able to make recommendations based on your concerns.'),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      )
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,

                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Postnatal Service'),
                            leading: Lottie.asset('lib/icons/63798-hospital-patient-clinical.json',height: 70,),
                            children: <Widget>[
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Pressed ElevatedButton');

                                    },
                                    child: Text('Book Appointment Now'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    child: Text('Postnatal care can also include assessment and counseling provided to the mother before discharge after giving birth in a health facility, as well as later contacts during home visits by community health workers or postnatal visits to a health facility. Broadly, the major elements of postnatal care include:counseling and health education on recognition of danger signs and appropriate care-seeking (for both mother and newborn) counseling and health education on routine care practices such as exclusive breastfeeding and good thermal care practices dispensing and related counseling for routine preventive interventions (such as chlorhexidine for cord-stump care and postnatal iron supplementation) assessment and case-management and referral for any identified complications or risk conditions It is through the same contacts that we have opportunities to improve outcomes for both mother and newborn, so programs and services should focus on needed care for both. This more integrated perspective is reflected in the most recent guidance from the World Health Organization (see Resources below). Home visitation by community health workers has been promoted as a postnatal care strategy based on promising pilots in South Asia that demonstrated potential for reducing newborn deaths. However, it has proven difficult to achieve comparable benefits under more routine conditions at scale. With the marked increases in institutional deliveries seen in many settings in recent years, there is increasing attention being given to taking better advantage of the time before discharge to ensure delivery of key aspects of postnatal care. Challenges to taking optimal advantage of this contact include the very high volume of births in some centers and the common practice of early discharge. Follow-up visits to the health facility for postnatal care can provide an important opportunity to ensure assessment, care, and provision of important counseling. Suitable timing and content of such care will depend on the overall configuration of postnatal care services specific to the setting.'),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      )
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Welfare Clinic'),
                            leading: Lottie.asset('lib/icons/15413-registro.json',height: 70,),
                            children: <Widget>[
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Pressed ElevatedButton');

                                    },
                                    child: Text('Book Appointment Now'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    child: Text('Infants are usually 2-weeks old when moved from Maternity Clinics to Child Welfare Clinics. CWC services include all health related matters. Children will be recommended for further tests and examinations where necessary to our Pediatrician. Monitoring and extra visits will be arranged if need be. Our priority as a facility is to identify any clinical issue in the child that prevents development. In the event that a disease breaks out during the prevention period, we diagnose it during its early stages and start treatment immediately. Regular checkups during our clinics ensure that your child is well-monitored by our pediatric staff. You can schedule for our special clinic days at our hospital.'),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      )
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Family Planning'),
                            leading: Lottie.asset('lib/icons/18646-medic-clinic.json',height: 70,),
                            children: <Widget>[
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Pressed ElevatedButton');

                                    },
                                    child: Text('Book Appointment Now'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    child: Text('Ensuring access for all people to their preferred contraceptive methods advances several human rights including the right to life and liberty, freedom of opinion and expression and the right to work and education, as well as bringing significant health and other benefits. Use of contraception prevents pregnancy-related health risks for women, especially for adolescent girls, and when births are separated by less than two years, the infant mortality rate is 45% higher than it is when births are 2-3 years apart and 60% higher than it is when births are four or more years apart [4]. It offers a range of potential non-health benefits that encompass expanded education opportunities and empowerment for women, and sustainable population growth and economic development for countries. The number of women desiring to use family planning has increased markedly over the past two decades, from 900 million in 2000 to nearly 1.1 billion in 2020.  Consequently, the number of women using a modern contraceptive method increased from 663 million to 851 million and the contraceptive prevalence rate increased from 47.7 to 49.0 per cent. An additional 70 million women are projected to be added by 2030 [5]'),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      )
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Cervical Prostate'),
                            leading: Lottie.asset('lib/icons/100838-content-moderation-website-design-animations.json',height: 70,),
                            children: <Widget>[
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Pressed ElevatedButton');

                                    },
                                    child: Text('Book Appointment Now'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    child: Text('Cancer screening is an important component of prevention and early detection in public health and clinical medicine. The evidence for cancer screening, however, is often contentious. A description and explanation of disagreements over the evidence for cervical, breast, and prostate screening may assist physicians, policymakers, and citizens faced with screening decisions and suggest directions for future screening research. There are particular issues to be aware of in the evidence base for each form of screening, which are summarized in this paper. Five tensions explain existing conflicts over the evidence: (1) data from differing contexts may not be comparable; (2) screening technologies affect evidence quality, and thus evidence must evolve with changing technologies; (3) the quality of evidence of benefit varies, and the implications are contested; (4) evidence about harm is relatively new, there are gaps in that evidence, and there is disagreement over what it means; and (5) evidence about outcomes is often poorly communicated. The following principles will assist people to evaluate and use the evidence: (1) attend closely to transferability; (2) consider the influence of technologies on the evidence base; (3) query the design of meta-analyses; (4) ensure harms are defined and measured; and (5) improve risk communication practices. More fundamentally, there is a need to question the purpose of cancer screening and the values that inform that purpose, recognizing that different stakeholders may value different things. If implemented, these strategies will improve the production and interpretation of the methodologically challenging and always-growing evidence for and against cancer screening.'),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      )
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25),
                  child: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                     // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppointmentPage();}));},
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Text('Male Circumsion'),
                            leading: Lottie.asset('lib/icons/131819-dental-clinic.json',height: 70,),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        print('Pressed ElevatedButton');

                                      },
                                      child: Text('Book Appointment Now'),
                                    ),
                                    Text('Circumcision is the surgical removal of the skin covering the tip of the penis. The procedure is fairly common for newborn boys in certain parts of the world, including the United States. Circumcision after the newborn period is possible, but its a more complex procedure. For some families, circumcision is a religious ritual. The procedure can also be a matter of family tradition, personal hygiene or preventive health care. For others, however, circumcision seems unnecessary or disfiguring.'),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      )
                  ),

                ),


              ],
            ),



          ),
        ],
      )
    );
  }
}



