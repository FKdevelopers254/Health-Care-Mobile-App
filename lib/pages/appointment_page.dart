import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key, }) : super(key: key);



  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  final user = FirebaseAuth.instance.currentUser!;




  final _ageController = TextEditingController();

  @override
  void dispose(){



    _ageController.dispose();
    super.dispose();
  }


  Future _addUserDetailsSickness(String firstname, String lastname,String email, String location, int age) async{


    await FirebaseFirestore.instance.collection('sickness').add({
      'firstname':firstname,
      'lastname':lastname,
      'email':email,
      'location':location,
      'age':age,

    }
    );




  }






  Future<void> addUserDetailsSickness() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final user = FirebaseAuth.instance.currentUser!;
    print(user.email);
    final userDetailsSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get();

    if (userDetailsSnapshot.docs.isNotEmpty) {
      final userDetails = userDetailsSnapshot.docs.first.data();
      final firstName = userDetails['firstname'];
      final lastName = userDetails['lastname'];
      final email = userDetails['email'];
      final location = userDetails['location'];
      final age = _ageController.text;

      print('User details found: ${userDetails.toString()}');

      try {
        await FirebaseFirestore.instance.collection('sickness').add({
          'firstname': firstName,
          'lastname': lastName,
          'email': email,
          'location': location,
          'age': age,
        });

        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your sickness details have been saved.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );// dismiss the progress indicator dialog
      } catch (e) {
        print('Error writing sickness details to Firestore: $e');
        Navigator.pop(context); // dismiss the progress indicator dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred while saving your sickness details. Please try again later.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    } else {
      // handle the case where the user details document doesn't exist
      Navigator.pop(context); // dismiss the progress indicator dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('User Details Not Found'),
            content: Text('We could not find your user details. Please try again later.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
  }







  @override
  Widget build(BuildContext context) {
    String td = user.email!;
    return Scaffold(

      appBar: AppBar(
      //  leading: IconButton(
      //    icon: Icon(Icons.arrow_back,),
       //   onPressed: () => Navigator.of(context).pop(),
       // ),


        actions: const [Icon(Icons.settings_input_composite_outlined),
        ],
        title: Text('Set or Book An Appointment',
          style: GoogleFonts.bebasNeue(
            fontSize: 22,),
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10 ,),
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 170,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.pink[200],borderRadius: BorderRadius.circular(12),),
                    child:
                    Column(
                      children: [
                        Row(
                          children: [
                            //animation or picture
                            Container(child: ClipRect(child: Lottie.asset('lib/icons/88284-doctor-prescription.json',height: 90,
                              //borderRadius: BorderRadius.circular(12),
                            ),
                            )),

                            const SizedBox(width: 20,),

                            //how do you feel
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('How do you feel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                  const SizedBox(height: 8,),

                                  Text('Fill Out the Medical Form',style: GoogleFonts.bebasNeue(
                                    fontSize: 14,),),
                                  Text('State your current condition',style: GoogleFonts.bebasNeue(
                                    fontSize: 14,),),



                                ],),
                            ),



                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [




                    SizedBox(height: 30,),
                    Text(td,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: TextField(
                            controller: _ageController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),

                              hintText: 'Type how you feel',
                              fillColor: Colors.grey[200],
                              filled: true,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () async {
                          await addUserDetailsSickness();
                          // Optionally, show a success message or navigate to a new page
                        },

                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}
