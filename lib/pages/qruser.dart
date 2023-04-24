import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clinic/read%20data/get_user_name.dart';

class QrUser extends StatefulWidget {
  final  result;
  const QrUser({required this.result});

  @override
  State<QrUser> createState() => _QrUserState();
}

class Result {
}



class _QrUserState extends State<QrUser> {
  final user = FirebaseAuth.instance.currentUser!;
  late final result;

  List<String> docIDS =[];



  Future getDoccId() async {
    await FirebaseFirestore.instance.collection('users').where('email',isEqualTo: result).get().then((snapshot) => snapshot.docs.forEach((document) {
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
    return Container(
      child: Expanded(
          child: FutureBuilder(future: getDoccId(),builder: (context, snapshot){
            return  GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 2),
                itemCount: docIDS.length,
                itemBuilder: (BuildContext context,int index) {
                  return GetUserName(documentId: docIDS[index]);

                });
          },)
      ),
    );
  }
}
