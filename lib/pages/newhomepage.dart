
import 'dart:ui';

import 'package:clinic/pages/profile.dart';
import 'package:clinic/pages/qrender.dart';
import 'package:clinic/pages/sicknesspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RHomePage extends StatefulWidget {
  const RHomePage({Key? key}) : super(key: key);

  @override
  State<RHomePage> createState() => _RHomePageState();
}

class _RHomePageState extends State<RHomePage> {
  double fem=0.9;
  double ffem= 0.8;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // homeshort19S (2:2596)
          width:  double.infinity,
          decoration:  BoxDecoration (
            color:  Color(0xffffffff),
            borderRadius:  BorderRadius.circular(50*fem),
          ),
          child:
          Column(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children:  [
              Container(
                // autogroupajigsBe (US5pPttDyEo7amQgshAjiG)
                padding:  EdgeInsets.fromLTRB(8*fem, 29*fem, 0*fem, 8*fem),
                width:  double.infinity,
                child:
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children:  [

                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('email', isEqualTo: user!.email)
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

                        return Column(
                          //  scrollDirection: Axis.horizontal,
                          children: snapshot.data!.docs.map((document) {
                            final firstName = document.get('firstname');
                            final lastName = document.get('lastname');


                            return Row(
                              children: [
                                Container(
                                  // heyjonathanletsstartexploringF (2:2605)
                                  margin:  EdgeInsets.fromLTRB(19*fem, 0*fem, 0*fem, 20*fem),
                                  constraints:  BoxConstraints (
                                    maxWidth:  232*fem,
                                  ),
                                  child:
                                  RichText(
                                    text:
                                    TextSpan(
                                      style:  GoogleFonts.raleway (

                                        fontSize:  25*ffem,
                                        fontWeight:  FontWeight.w500,
                                        height:  1.6*ffem/fem,
                                        letterSpacing:  0.75*fem,
                                        color:  Color(0xff252b5c),
                                      ),
                                      children:  [
                                        TextSpan(
                                          text:  'Hey,',
                                          style:  GoogleFonts.lato (

                                            fontSize:  25*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.6*ffem/fem,
                                            letterSpacing:  0.75*fem,
                                            color:  Color(0xff252b5c),
                                          ),
                                        ),
                                        TextSpan(
                                          text:  ' ',
                                          style:  GoogleFonts.lato(

                                            fontSize:  25*ffem,
                                            fontWeight:  FontWeight.w600,
                                            height:  1.6*ffem/fem,
                                            letterSpacing:  0.75*fem,
                                            color:  Color(0xff252b5c),
                                          ),
                                        ),

                                        TextSpan(
                                          text:  '$firstName $lastName',
                                          style:  GoogleFonts.lato (

                                            fontSize:  25*ffem,
                                            fontWeight:  FontWeight.w800,
                                            height:  1.6*ffem/fem,
                                            letterSpacing:  0.75*fem,
                                            color:  Color(0xff234f68),
                                          ),
                                        ),
                                        TextSpan(
                                          text:  ' \n',
                                          style:  GoogleFonts.lato (

                                            fontSize:  25*ffem,
                                            fontWeight:  FontWeight.w800,
                                            height:  1.6*ffem/fem,
                                            letterSpacing:  0.75*fem,
                                            color:  Color(0xff252b5c),
                                          ),
                                        ),
                                        TextSpan(
                                          text:  'We care about your HEALTH',
                                          style:  GoogleFonts.lato (

                                            fontSize:  25*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.6*ffem/fem,
                                            letterSpacing:  0.75*fem,
                                            color:  Color(0xff252b5c),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  // buttonnotificationyfv (2:2608)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                  width:  50*fem,
                                  height:  50*fem,
                                  child:
                                  Image(image: AssetImage('lib/images/nurse.png'),),
                                ),

                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  
                   //My Apointments
                    Container(
                      // autogroup7w2qADE (US5motMqtnng1DxbEk7w2Q)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupebsyhDA (US5n48T7RFzQTpbt6neBSY)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 1*fem),
                            padding:  EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 0*fem),
                            width:  370*fem,
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(25*fem),
                              color:  Color(0x63000000),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image: AssetImage('lib/images/wallpaper.jpg'),
                              ),
                            ),
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // textYja (2:2650)
                                  margin:  EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 7*fem),
                                  constraints:  BoxConstraints (
                                    maxWidth:  120*fem,
                                  ),
                                  child:
                                  Text(
                                    'My Appointments',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  18*ffem,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.175*ffem/fem,
                                      letterSpacing:  0.54*fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // textSKA (2:2651)
                                  margin:  EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 19*fem),
                                  child:
                                  Text(
                                    'View previous diagnosis from your Doctor',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  14*ffem,
                                      fontWeight:  FontWeight.w400,
                                      height:  1.175*ffem/fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupy7b6k4x (US5nANmhhg8bxnVrLbY7b6)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 177*fem, 0*fem),
                                  padding:  EdgeInsets.fromLTRB(34*fem, 26*fem, 42*fem, 22.92*fem),
                                  decoration:  BoxDecoration (
                                    color:  Color(0xff234f68),
                                    borderRadius:  BorderRadius.only (
                                      topRight:  Radius.circular(25*fem),
                                    ),
                                  ),
                                  child:
                                  Column(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.deepPurple[200],

                                        ),
                                        child: Center(child:
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UserSicknessDetailsPage()),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Center(
                                                // groupSTa (2:2653)
                                                child:
                                                SizedBox(
                                                  width:  20*fem,
                                                  height:  20*fem,
                                                  child:
                                                  Image(image: AssetImage('lib/images/nurse.png'),),
                                                ),
                                              ),
                                              Text('View More',style: TextStyle(color: Colors.white,
                                              ),),
                                            ],
                                          ),
                                        ),),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),

                    //My Profile
                    Container(
                      // autogroup7w2qADE (US5motMqtnng1DxbEk7w2Q)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupebsyhDA (US5n48T7RFzQTpbt6neBSY)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 1*fem),
                            padding:  EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 0*fem),
                            width:  370*fem,
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(25*fem),
                              color:  Color(0x63000000),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image: AssetImage('lib/images/wallpaper3.jpg'),
                              ),
                            ),
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // textYja (2:2650)
                                  margin:  EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 7*fem),
                                  constraints:  BoxConstraints (
                                    maxWidth:  120*fem,
                                  ),
                                  child:
                                  Text(
                                    'My Profile',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  18*ffem,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.175*ffem/fem,
                                      letterSpacing:  0.54*fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // textSKA (2:2651)
                                  margin:  EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 19*fem),
                                  child:
                                  Text(
                                    'View your personal Details',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  14*ffem,
                                      fontWeight:  FontWeight.w400,
                                      height:  1.175*ffem/fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupy7b6k4x (US5nANmhhg8bxnVrLbY7b6)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 177*fem, 0*fem),
                                  padding:  EdgeInsets.fromLTRB(34*fem, 26*fem, 42*fem, 22.92*fem),
                                  decoration:  BoxDecoration (
                                    color:  Color(0xff234f68),
                                    borderRadius:  BorderRadius.only (
                                      topRight:  Radius.circular(25*fem),
                                    ),
                                  ),
                                  child:
                                  Column(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.deepPurple[200],

                                        ),
                                        child: Center(child:
                                        Column(
                                          children: [
                                            StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .where('email', isEqualTo: user!.email)
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text('An error occurred while loading the data.'),
                                                  );
                                                }

                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return Center(
                                                    child: Lottie.asset('lib/icons/18646-medic-clinic.json'),
                                                  );
                                                }

                                                if (snapshot.data!.docs.isEmpty) {
                                                  return Center(
                                                    child: Text('No  details found.'),
                                                  );
                                                }

                                                return Column(
                                                  children: snapshot.data!.docs.map((document) {
                                                    final firstname = document.get('firstname');
                                                    final lastname = document.get('lastname');
                                                    final age = document.get('age');
                                                    final location = document.get('location');


                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => UpdateProf(docId: document.id,)),
                                                        );
                                                      },
                                                      //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                                                      child: Row(
                                                        children: [

                                                          Image.asset('lib/images/wallpaper.jpg',height: 20,),
                                                          Text('Update',style: GoogleFonts.andika(color: Colors.white,),)
                                                        ],
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      )
                                                    );
                                                  }).toList(),
                                                );
                                              },
                                            ),

                                          ],
                                        ),),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    //Settings
                    Container(
                      // autogroup7w2qADE (US5motMqtnng1DxbEk7w2Q)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupebsyhDA (US5n48T7RFzQTpbt6neBSY)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 1*fem),
                            padding:  EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 0*fem),
                            width:  370*fem,
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(25*fem),
                              color:  Color(0x63000000),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image: AssetImage('lib/images/radar.jpg'),
                              ),
                            ),
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // textYja (2:2650)
                                  margin:  EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 7*fem),
                                  constraints:  BoxConstraints (
                                    maxWidth:  120*fem,
                                  ),
                                  child:
                                  Text(
                                    'Settings',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  18*ffem,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.175*ffem/fem,
                                      letterSpacing:  0.54*fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.3),
                                    // textSKA (2:2651)
                                    margin:  EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 19*fem),
                                    child:
                                    Text(
                                      'Update your app to your personal setting',
                                      style:  GoogleFonts.raleway (

                                        fontSize:  14*ffem,
                                        fontWeight:  FontWeight.w600,
                                        height:  1.175*ffem/fem,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupy7b6k4x (US5nANmhhg8bxnVrLbY7b6)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 177*fem, 0*fem),
                                  padding:  EdgeInsets.fromLTRB(34*fem, 26*fem, 42*fem, 22.92*fem),
                                  decoration:  BoxDecoration (
                                    color:  Color(0xff234f68),
                                    borderRadius:  BorderRadius.only (
                                      topRight:  Radius.circular(25*fem),
                                    ),
                                  ),
                                  child:
                                  Column(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.deepPurple[200],

                                        ),
                                        child: Center(child:
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UserSicknessDetailsPage()),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Center(
                                                // groupSTa (2:2653)
                                                child:
                                                SizedBox(
                                                  width:  20*fem,
                                                  height:  20*fem,
                                                  child:
                                                  Image(image: AssetImage('lib/images/nurse.png'),),
                                                ),
                                              ),
                                              Text('Update',style: TextStyle(color: Colors.white,
                                              ),),
                                            ],
                                          ),
                                        ),),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    //QR
                    Container(
                      // autogroup7w2qADE (US5motMqtnng1DxbEk7w2Q)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupebsyhDA (US5n48T7RFzQTpbt6neBSY)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 1*fem),
                            padding:  EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 0*fem),
                            width:  370*fem,
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(25*fem),
                              color:  Color(0x63000000),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image: AssetImage('lib/images/qr.jpg'),
                              ),
                            ),
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  color: Colors.blue.withOpacity(0.8),
                                  // textYja (2:2650)
                                  margin:  EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 7*fem),
                                  constraints:  BoxConstraints (
                                    maxWidth:  120*fem,
                                  ),
                                  child:
                                  Text(
                                    'My QR CODE',
                                    style:  GoogleFonts.raleway (

                                      fontSize:  18*ffem,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.175*ffem/fem,
                                      letterSpacing:  0.54*fem,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.blue.withOpacity(0.8),
                                    // textSKA (2:2651)
                                    margin:  EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 19*fem),
                                    child:
                                    Text(
                                      'Use this to scan in the Hospital for easy reference',
                                      style:  GoogleFonts.raleway (

                                        fontSize:  14*ffem,
                                        fontWeight:  FontWeight.w600,
                                        height:  1.175*ffem/fem,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupy7b6k4x (US5nANmhhg8bxnVrLbY7b6)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 177*fem, 0*fem),
                                  padding:  EdgeInsets.fromLTRB(34*fem, 26*fem, 42*fem, 22.92*fem),
                                  decoration:  BoxDecoration (
                                    color:  Color(0xff234f68),
                                    borderRadius:  BorderRadius.only (
                                      topRight:  Radius.circular(25*fem),
                                    ),
                                  ),
                                  child:
                                  Column(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.deepPurple[200],

                                        ),
                                        child: Center(child:
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Qrender()),
                                            );
                                          },
                                          child: Row(

                                            children: [
                                              Center(
                                                // groupSTa (2:2653)
                                                child:
                                                SizedBox(
                                                  width:  20*fem,
                                                  height:  20*fem,
                                                  child:
                                                  Image(image: AssetImage('lib/images/qr.jpg'),),
                                                ),
                                              ),
                                              Text('Scan Me',style: GoogleFonts.andika(color: Colors.white,fontWeight: FontWeight.w400
                                              ),),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          ),
                                        ),),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    //My Profile
                    Container(
                      // itemheadertextbuttonwidesKv (2:2598)
                      margin:  EdgeInsets.fromLTRB(17*fem, 0*fem, 23*fem, 0*fem),
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // featuredestatesBbW (I2:2598;15:71)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 143*fem, 0*fem),
                            child:
                            Text(
                              'My Profile',
                              style:  GoogleFonts.lato (

                                fontSize:  18*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.2*ffem/fem,
                                letterSpacing:  0.54*fem,
                                color:  Color(0xff252b5c),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    
                    SizedBox(height:10),



                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
