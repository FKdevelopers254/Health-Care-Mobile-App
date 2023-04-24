import 'package:clinic/admin/singlepatient.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewPatients extends StatefulWidget {
  @override
  _ViewPatientsState createState() =>
      _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Patients'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
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
            children: snapshot.data!.docs.map((document) {
              final firstName = document.get('firstname');
              final lastName = document.get('lastname');
              final email = document.get('email');
              final location = document.get('location');
              final age = document.get('age');

              return Column(
                children: [

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(


                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.pink[200],
                          ),
                          child: Column(
                            //picture
                            children: [
                              //image
                              //ClipRect(child: Lottie.asset('lib/icons/'+'${data['imagepath']}',height: 90,
                              //borderRadius: BorderRadius.circular(12),),),
                              const SizedBox(height: 10,),
                              //rating
                              Container(


                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple[200],),
                                child: Padding(

                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [

                                      Icon(Icons.star,color: Colors.yellow[200],),
                                      Text('$email',style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),



                                    ],
                                  ),
                                ),
                              ),
                              //name
                              Text('$age',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),



                              const SizedBox(height: 5,),
                              //Profession
                              Container(
                                  padding:const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.deepPurple[200],),
                                  child: Text('$firstName $lastName',style: const TextStyle(color: Colors.white),)),
                              Container(
                                  padding:const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.deepPurple[200],),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SinglePatient(userId: email)),
                                      );
                                    },
                                      child: Text('View',style: const TextStyle(color: Colors.white),))),





                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
