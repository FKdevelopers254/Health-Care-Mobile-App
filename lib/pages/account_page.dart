import 'package:clinic/pages/profile.dart';
import 'package:clinic/pages/sicknesspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../admin/adminpage.dart';
import '../read data/get_doctors.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}





class _AccountPageState extends State<AccountPage> {

  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDS =[];

  Future getDoccId() async {
    await FirebaseFirestore.instance.collection('doctors').orderBy('doctorname',descending: true).get().then((snapshot) => snapshot.docs.forEach((document) {
      if (kDebugMode) {
        print(document.reference);
      }
      docIDS.add(document.reference.id);
    }));

  }


  @override
  void initState() {
    getDoccId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const SizedBox(height:5),


            //Customized App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                  const SizedBox(height:8),
                  Text(user.email!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),),
                ],),

                Container(decoration: BoxDecoration(color: Colors.deepPurple[200],borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                   //   onTap: (){FirebaseAuth.instance.signOut();},
                      child: GestureDetector(
                        onLongPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPatients()));
                        },

                          child: Lottie.asset('lib/icons/101571-pediatrics.json',height: 50,))),
                ),
              ],),
            ),
            const SizedBox(height: 10),

            //CArd How do you feel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.pink[200],borderRadius: BorderRadius.circular(12),),
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
                          const Text('Check Diagnosis',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          const SizedBox(height: 8,),
                          const Text('Check Out the Medical Form',style: TextStyle(fontSize: 14),),
                          const SizedBox(height: 8,),
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
                              child: Text('Appointments',style: TextStyle(color: Colors.white,
                              ),),
                            ),),),
                          const SizedBox(height: 8,),
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
                                  MaterialPageRoute(builder: (context) => UpdateProf(docId: '',)),
                                );
                              },
                              child: Text('Profile',style: TextStyle(color: Colors.white,
                              ),),
                            ),),),

                        ],),
                    ),



                  ],
                ),
              ),
            ),
            const SizedBox(height:10),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text("Our Doctors",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  GestureDetector(
                  //    onTap: (){
                 //       Navigator.push(context, MaterialPageRoute(builder: (context) => const  ()),
                  //      );
                   //   },
                      child: const Text("See all",style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            const SizedBox(height:10),
            Expanded(
                child: FutureBuilder(future: getDoccId(),builder: (context, snapshot){
                  return  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 2),
                      itemCount: docIDS.length,
                      itemBuilder: (BuildContext context,int index) {
                        return GetDoctors(documentId: docIDS[index]);

                      });
                },)
            ),
          ],
        ),
        ),
      ),
    );
  }
}
