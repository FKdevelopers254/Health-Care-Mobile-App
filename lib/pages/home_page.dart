
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

import 'package:clinic/pages/service_page.dart';
import 'package:clinic/util/doctor_card.dart';
import 'package:shimmer/shimmer.dart';

import '../util/category_card.dart';
import 'appointment_page.dart';
import 'doctors_page.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final user = FirebaseAuth.instance.currentUser!;










  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],


      body: SafeArea(

        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          children: [
            Column(children: [


              //appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                    Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Text(
                        'TIMIZA CLINIC', textAlign: TextAlign.center, style: GoogleFonts.andika(letterSpacing:4.5,fontSize: 18.0, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),


                    const SizedBox(height:8),
                    Text(user.email!,style:  GoogleFonts.andika(fontWeight: FontWeight.bold,fontSize: 24,),),
                  ],),

                  Container(decoration: BoxDecoration(color: Colors.deepPurple[200],borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                        onTap: (){FirebaseAuth.instance.signOut();},
                        child: Lottie.asset('lib/icons/101571-pediatrics.json',height: 70,)),
                  ),
                ],),
              ),

              const SizedBox(height: 10),




              //card-how do you feel
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(25),
                    color:  Color(0x63000000),
                    image:  DecorationImage (
                      fit:  BoxFit.cover,
                      image: AssetImage('lib/images/radar.jpg'),
                    ),
                  ),

                  child:
                  Row(
                    children: [
                      //animation or picture
                      Container(child: ClipRect(child: Lottie.asset('lib/icons/65710-hospital-5.json',height: 90,
                        //borderRadius: BorderRadius.circular(12),
                      ),
                      )),

                      const SizedBox(width: 20,),

                      //how do you feel
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Text('How do you feel',style: GoogleFonts.andika(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                            SizedBox(height: 8,),
                           Text('Fill Out the Medical Form and We Will contact you Immediately we get a Diagnosis',style: GoogleFonts.andika(color:Colors.white,fontSize: 14),),

                          const SizedBox(height: 8,),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(25),
                              color:  Color(0x63000000),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image: AssetImage('lib/images/button.jpg'),
                              ),
                            ),

                            child: GestureDetector(
                              onTap:  () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const AppointmentPage();}));},
                              child:  Container(
                                color: Colors.white.withOpacity(0.8),
                                child: Center(child: Text('Fill Medical Form',style: GoogleFonts.andika(color: Colors.black,
                                ),),),
                              ),
                            ),),
                        ],),
                      ),



                    ],
                  ),
                ),
              ),



              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()),
                          );
                        },
                        child: Text("Our Services",style: GoogleFonts.andika(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()),
                          );
                        },
                        child: Text("See all",style: GoogleFonts.andika(color: Colors.black,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
              const SizedBox(height: 5,),


              //horizontal list view---categories--dentist,surgeon,nurse
              Container(
                height:40,

                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('services')
                     // .where('email', isEqualTo: user!.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('An error occurred while loading the data.'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('No sickness details found.'),
                      );
                    }

                    return ListView(
                       scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map((document) {
                        final title = document.get('title');
                      //  final description = document.get('description');


                        return CategoryCard(
                          categoryName: '$title',
                          iconImagePath: 'lib/icons/syringe.png',
                        );
                      }).toList(),
                    );
                  },
                ),
                ),


              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsPage()),
                        );
                      },
                      child: Text("Doctors",style: GoogleFonts.andika(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsPage()),
                        );
                      },
                      child: Text("See all",style: GoogleFonts.andika(color: Colors.black,fontWeight: FontWeight.bold),)),
                ],),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 237,

                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  DoctorCard(
                    doctorImagePath: 'lib/images/male-nurse.png',
                    rating: '4.5',
                    doctorName: 'Nash Tunic',
                    doctorProffession: 'Therapist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'lib/images/nurses.png',
                    rating: '4.5',
                    doctorName: 'Frank Nzoka',
                    doctorProffession: 'Scientist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'lib/images/nurse.png',
                    rating: '4.5',
                    doctorName: 'Last Seal',
                    doctorProffession: 'Radiologist',
                  ),


                ],
              ),),






              //doctor list
            ],
            ),
          ],
        ),
      ),
    );
  }
}
