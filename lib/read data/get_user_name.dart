import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetUserName extends StatelessWidget {

  final String documentId;
  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(future:users.doc(documentId).get(),builder: (context, snapshot){

      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic>data = snapshot.data!.data() as Map<String, dynamic>;
        return   Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.pink[200],
                ),
                child: Column(
                  //picture
                  children: [
                    //image
                    ClipRect(child: Lottie.asset('lib/icons/22628-hospital.json',height: 90,
                      //borderRadius: BorderRadius.circular(12),
                    ),
                    ),
                    SizedBox(height: 10,),
                    //rating
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurple[200],),
                      child: Row(
                        children: [

                          Icon(Icons.star,color: Colors.yellow[200],),
                          Text('${data['age']}',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),



                        ],
                      ),
                    ),
                    //name
                    Text('${data['firstname']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    //Profession
                    Container(
                        padding:EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepPurple[200],),
                        child: Text('${data['lastname']}'+' '+'${data['prescription']}',style: TextStyle(color: Colors.white),)),





                  ],
                ),
              ),
            ),
          ],
        );

        Text('${data['doctorname']}'+' '+'${data['proffesion']}'+' '+'${data['rating']}');


      }
      return Text('Loading...');



    });
  }
}
