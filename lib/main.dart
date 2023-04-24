
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';





import 'auth/main_page.dart';




Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      home: const MainPage(),


      // getPages: [
      //   GetPage(name: '/', page: () => OnBoardingScreen()),
      //   GetPage(name: '/appointment', page: () => const AppointmentPage()),
      //   GetPage(name: '/pharmacy', page: () => const PharmacyPage()),
      //  ],



      theme: ThemeData(primarySwatch: Colors.deepPurple,useMaterial3: true,),





    );
  }
}
