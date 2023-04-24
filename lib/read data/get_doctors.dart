import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class GetDoctors extends StatelessWidget {


  final String documentId;
  GetDoctors({required this.documentId});

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('doctors');

    return FutureBuilder<DocumentSnapshot>(future:users.doc(documentId).get(),builder: (context, snapshot){


      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic>data = snapshot.data!.data() as Map<String, dynamic>;
        return   Column(
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
                            Text('${data['rating']}',style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),



                          ],
                        ),
                      ),
                    ),
                    //name
                    Text('${data['doctorname']}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),



                    const SizedBox(height: 5,),
                    //Profession
                    Container(
                        padding:const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepPurple[200],),
                        child: Text('${data['proffesion']}' + ', 7 Yrs Exp',style: const TextStyle(color: Colors.white),)),





                  ],
                ),
              ),
            ),
          ],
        );

     //     Text('${data['doctorname']}'+' '+'${data['proffesion']}'+' '+'${data['rating']}');


      }
      return const Text('Loading...');



    });
  }
}
