import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:majascan/majascan.dart';
import 'package:clinic/pages/qruser.dart';
import 'package:clinic/read%20data/get_user_name.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'doctors_page.dart';



class QrPage extends StatefulWidget {
  @override
  QrPageState createState() {
    return new QrPageState();
  }
}

class QrPageState extends State<QrPage> {
  String result = 'Wewe';


  List<String> docIDS =[];

  Future getDoccId() async {
    await FirebaseFirestore.instance.collection('users').where('email',isEqualTo:result ).get().then((snapshot) => snapshot.docs.forEach((document) {
      if (kDebugMode) {
        print(document.reference);
      }
      docIDS.add(document.reference.id);
    }));

  }



  Future _scanQR() async {
    try {
      String? qrResult = await MajaScan.startScan(
          title: "QRcode scanner",

          flashlightEnable: true,

          titleColor: Colors.amberAccent[700],
          qRCornerColor: Colors.orange,
          qRScannerColor: Colors.orange);
      setState(() {
        result = qrResult ?? 'null string';

      });
    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Column(
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QrUser(result: null,)),
                );
              },
              child: Text(
                result,
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




