import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class UserSicknessDetailsPage extends StatefulWidget {
  @override
  _UserSicknessDetailsPageState createState() =>
      _UserSicknessDetailsPageState();
}

class _UserSicknessDetailsPageState extends State<UserSicknessDetailsPage> {
  double fem=0.9;
  double ffem= 0.8;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Text(
            'APPOINTMENTS', textAlign: TextAlign.center, style: GoogleFonts.andika(letterSpacing:3.5,fontSize: 20.0, fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('sickness')
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

          return ListView(
            children: [
              Column(
              //  scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((document) {
                  final firstName = document.get('firstname');
                  final lastName = document.get('lastname');
                  final email = document.get('email');
                  final location = document.get('location');
                  final age = document.get('age');
                  final diagnosed = document.get('diagnosed');



                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      // estatescardhorizontalshortyDr (2:2628)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                      padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 24*fem, 8*fem),

                      height:  150,
                      decoration:  BoxDecoration (

                        color: diagnosed ? Colors.green.withOpacity(0.3) : Colors.transparent,
                        border: diagnosed ? null : Border.all(color: Colors.red, width: 2),
                       // color:  diagnosed ? Colors.green : Colors.red,
                       // color:  Color(0xfff5f4f7),
                        borderRadius:  BorderRadius.circular(25*fem),
                      ),
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // shapee56 (2:2629)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                            padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
                            width:  126*fem,
                            height:  double.infinity,
                            decoration:  BoxDecoration (
                              color:  Color(0x14884af6),
                              borderRadius:  BorderRadius.circular(18*fem),
                              image:  DecorationImage (
                                fit:  BoxFit.cover,
                                image:  AssetImage('lib/images/nurse.png'),
                              ),
                            ),
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // buttonfavoriteumi (2:2635)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 74*fem),
                                  width:  25*fem,
                                  height:  25*fem,
                                  child:
                                  Image(image: AssetImage('lib/images/nurse.png'),),
                                ),
                                ClipRect(
                                  // buttoncategorysquaretextsmallR (2:2631)
                                  child:
                                  BackdropFilter(
                                    filter:  ImageFilter.blur (
                                      sigmaX:  4*fem,
                                      sigmaY:  4*fem,
                                    ),
                                    child:
                                    Container(
                                      padding:  EdgeInsets.fromLTRB(7*fem, 7*fem, 7*fem, 5*fem),
                                      width:  74*fem,
                                      height:  25*fem,
                                      decoration:  BoxDecoration (
                                        color:  Color(0xaf3f467c),
                                        borderRadius:  BorderRadius.circular(8*fem),
                                      ),
                                      child:
                                      Container(
                                        // layouthBn (2:2632)
                                        width:  double.infinity,
                                        height:  double.infinity,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // text2E4 (2:2633)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
                                              child:
                                              Text(
                                                '🏢',
                                                style:  GoogleFonts.raleway (

                                                  fontSize:  11*ffem,
                                                  fontWeight:  FontWeight.w400,
                                                  height:  1.175*ffem/fem,
                                                  letterSpacing:  0.33*fem,
                                                  color:  Color(0xff252b5c),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // textKyr (2:2634)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                              child:
                                              Text(
                                                'fd',
                                                style:  GoogleFonts.raleway (

                                                  fontSize:  8*ffem,
                                                  fontWeight:  FontWeight.w500,
                                                  height:  1.175*ffem/fem,
                                                  letterSpacing:  0.24*fem,
                                                  color:  Color(0xfff5f4f7),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupqovrdzY (US5nzX49iujAuQsRw6QoVr)
                            margin:  EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 13*fem),
                            width:  94*fem,
                            height:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // layouty2p (2:2639)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
                                  width:  double.infinity,
                                  child:
                                  Column(
                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                    children:  [
                                      Container(
                                        // textJqn (2:2640)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                        constraints:  BoxConstraints (
                                          maxWidth:  94*fem,
                                        ),
                                        child:
                                        Text(
                                          '$firstName $lastName $email $location $age',
                                          style:  GoogleFonts.raleway (

                                            fontSize:  12*ffem,
                                            fontWeight:  FontWeight.w700,
                                            height:  1.5*ffem/fem,
                                            letterSpacing:  0.36*fem,
                                            color:  Color(0xff252b5c),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  // layoutjTE (2:2636)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                  width:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.end,
                                    children:  [
                                      Text(
                                        // 4kQ (2:2637)
                                        '\$ 290',
                                        style:  GoogleFonts.montserrat (

                                          fontSize:  16*ffem,
                                          fontWeight:  FontWeight.w600,
                                          height:  1.2175*ffem/fem,
                                          letterSpacing:  0.48*fem,
                                          color:  Color(0xff252b5c),
                                        ),
                                      ),
                                      Text(
                                        // textohz (2:2638)
                                        '/month',
                                        style:  GoogleFonts.montserrat (

                                          fontSize:  8*ffem,
                                          fontWeight:  FontWeight.w500,
                                          height:  1.625*ffem/fem,
                                          letterSpacing:  0.24*fem,
                                          color:  Color(0xff252b5c),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
