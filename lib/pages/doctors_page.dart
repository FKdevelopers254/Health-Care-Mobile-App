
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/doctors.dart';


class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key, }) : super(key: key);



  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () => Navigator.of(context).pop(),
        ),


        actions: const [Icon(Icons.settings_input_composite_outlined),
        ],
        title: Text('Our Qualified & Experience Doctors',
          style: GoogleFonts.bebasNeue(
            fontSize: 22,),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 10 ,),
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 170,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.pink[200],borderRadius: BorderRadius.circular(12),),
                    child:
                    Row(
                      children: [
                        //animation or picture
                        Container(child: ClipRect(child: Image.asset('lib/images/male-nurse.png',height: 90,
                          //borderRadius: BorderRadius.circular(12),
                        ),
                        )),

                        SizedBox(width: 20,),

                        //how do you feel
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('How do you feel?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              const Text('We Care for you',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                              const SizedBox(height: 8,),

                              Text('Contact with any of our doctors',style: GoogleFonts.bebasNeue(
                                fontSize: 14,),),
                              const SizedBox(height: 8,),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple[300],

                                ),
                                child: const Center(child: Text('Get Started',style: TextStyle(color: Colors.white,),),),),
                            ],),
                        ),




                      ],
                    ),



                  ),



                ),
                const SizedBox(height: 20,),

                Container(


                  child: Column(


                    children: [
                      Doctors(
                        doctorImagePath: 'lib/images/male-nurse.png',
                        rating: '4.5',
                        doctorName: 'Nash Tunic',
                        doctorProffession: 'Therapist',
                      ),

                      Doctors(
                        doctorImagePath: 'lib/images/nurses.png',
                        rating: '4.5',
                        doctorName: 'Frank Nzoka',
                        doctorProffession: 'Scientist',
                      ),
                      Doctors(
                        doctorImagePath: 'lib/images/nurse.png',
                        rating: '4.5',
                        doctorName: 'Last Seal',
                        doctorProffession: 'Radiologist',
                      ),


                    ],
                  ),
                ),









              ],
            ),
          ],
        )
      ),
    );
  }
}
