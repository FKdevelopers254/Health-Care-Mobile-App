import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrender extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

   Qrender({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      child: QrImage(
        data: user.displayName!,
        version: QrVersions.auto,
        size: 320,
        gapless: false,
      ),


    );
  }
}
